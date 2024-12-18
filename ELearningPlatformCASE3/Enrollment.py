from DataBaseConnection import DatabaseConnection
import pyodbc
from prettytable import PrettyTable
from datetime import datetime

class Enrollment:
    def __init__(self,enrollees_id, student_id,course_id,schedule_id):
        self.enrollees_id = enrollees_id
        self._student_id = student_id
        self._course_id = course_id
        self._schedule_id = schedule_id

    def enroll_student_db(self, connection_string):
        conn = None
        try:
            conn = DatabaseConnection.get_connection()
            cursor = conn.cursor()

            cursor.execute(
            "EXEC InsertIntoEnrollment ?, ?, ?",
            self._student_id,
            self._course_id,
            self._schedule_id
            )
            conn.commit()
            print("You are successfully Enrolled in this Course!")

        except pyodbc.Error as e:
            print(f"Database Error: {e}")
        except Exception as e:
            print(f"Unexpected Error: {e}")

        finally:
            if conn:
                conn.close()

    @staticmethod
    def show_all_enrolled_students():
        conn = None
        try:
            conn = DatabaseConnection.get_connection()
            cursor = conn.cursor()

            cursor.execute("Select * FROM Enrollment")
            enrollees = cursor.fetchall()

            if enrollees:
                table = PrettyTable()
                table.field_names = [
                    "EnrolleesID", "StudentID", "CourseID", "SchedulesID"
                ]
                for enrollee in enrollees:
                    table.add_row(enrollee)
                print(table)
            else:
                print("No record of Enrollment found in the Database")

        except pyodbc.Error as e:
            print(f"Database Error: {e}")

        except Exception as e:
            print(f"Unexpected Error: {e}")

        finally:
            if conn:
                conn.close()

    @classmethod
    def view_enrollment_details(cls, connection_string):
        enrollment_id = input("Enter EnrollmentID to view details: ")
        conn = None
        try:
            # Connect to the database
            conn = pyodbc.connect(connection_string)
            cursor = conn.cursor()

            # SQL Query
            query = """
            SELECT 
                dbo.Students.FirstName, 
                dbo.Students.LastName, 
                dbo.Course.Title, 
                dbo.Schedule.Days, 
                dbo.Schedule.StartTime, 
                dbo.Schedule.EndTime
            FROM 
                dbo.Enrollment
            INNER JOIN 
                dbo.Schedule ON dbo.Enrollment.ScheduleID = dbo.Schedule.ScheduleID
            INNER JOIN 
                dbo.Students ON dbo.Enrollment.StudentID = dbo.Students.StudentID
            INNER JOIN 
                dbo.Course ON dbo.Enrollment.CourseID = dbo.Course.CourseID
            WHERE 
                dbo.Enrollment.EnrolleesID = ?;
            """

            # Execute the query with the input parameter
            cursor.execute(query, (enrollment_id,))
            result = cursor.fetchone()

            if result:
                # Display the result in a table format
                table = PrettyTable()
                table.field_names = [
                    "First Name", "Last Name", "Course Title",
                    "Days", "Start Time", "End Time"
                ]
                table.add_row(result)
                print(table)
            else:
                print("No record found for the given EnrollmentID.")

        except pyodbc.Error as e:
            print(f"Database Error: {e}")
        except Exception as e:
            print(f"Unexpected Error: {e}")
        finally:
            if conn:
                conn.close()

    @staticmethod
    def view_assignments(connection_string, student_id):
        print("View Assignments")

        conn = None

        try:
            # Connect to the database
            conn = pyodbc.connect(connection_string)
            cursor = conn.cursor()

            # Check if StudentID exists
            cursor.execute("SELECT COUNT(*) FROM Enrollment WHERE StudentID = ?", student_id)
            if cursor.fetchone()[0] == 0:
                print(f"No enrollment records found for StudentID {student_id}.")
                return

            # Fetch assignments for the given StudentID
            query = """
                    SELECT s.FirstName, s.LastName, c.Title AS Course, 
                           a.Title AS Assignment, a.Description, a.DueDate, 
                           a.SubmissionDate, a.Status, a.AssignmentID
                    FROM dbo.Assignments a
                    INNER JOIN dbo.Enrollment e ON a.EnrolleesID = e.EnrolleesID
                    INNER JOIN dbo.Course c ON a.CourseID = c.CourseID AND e.CourseID = c.CourseID
                    INNER JOIN dbo.Students s ON e.StudentID = s.StudentID
                    WHERE e.StudentID = ?;
                    """
            cursor.execute(query, student_id)
            assignments = cursor.fetchall()

            if not assignments:
                print("No assignments found for your StudentID.")
                return

            # Display assignments in a table format
            table = PrettyTable()
            table.field_names = [
                "FirstName",
                "LastName",
                "CourseTitle",
                "Assignment",
                "Description",
                "DueDate",
                "SubmissionDate",
                "Status",
                "Assignment Code"
            ]
            for assignment in assignments:
                table.add_row([
                    assignment.FirstName,
                    assignment.LastName,
                    assignment.Course,
                    assignment.Assignment,
                    assignment.Description,
                    assignment.DueDate,
                    assignment.SubmissionDate if assignment.SubmissionDate else "Not Submitted",
                    assignment.Status,
                    assignment.AssignmentID
                ])
            print(table)

        except pyodbc.Error as e:
            print(f"Database Error: {e}")
        except Exception as e:
            print(f"Unexpected Error: {e}")
        finally:
            if conn:
                conn.close()

    @classmethod
    def update_assignment_submission(cls, connection_string):
        print("Update Assignment Submission")

        conn = None

        try:
            # Connect to the database
            conn = pyodbc.connect(connection_string)
            cursor = conn.cursor()

            # Get inputs from the user
            assignment_id = int(input("Enter the AssignmentID: "))
            submission_date_str = input("Enter the Submission Date (YYYY-MM-DD): ")

            # Parse the submission date
            submission_date = datetime.strptime(submission_date_str, "%Y-%m-%d").date()

            # Fetch the assignment's DueDate
            cursor.execute("SELECT DueDate FROM Assignments WHERE AssignmentID = ?", (assignment_id,))
            result = cursor.fetchone()

            if not result:
                print(f"No assignment found with ID {assignment_id}.")
                return

            # Convert due_date from string to date for comparison
            due_date = datetime.strptime(result[0], "%Y-%m-%d").date()

            # Update the assignment
            cursor.execute("""
            UPDATE Assignments
            SET SubmissionDate = ?, 
                Status = CASE 
                            WHEN ? > DueDate THEN 'Overdue' 
                            ELSE 'Submitted' 
                         END
            WHERE AssignmentID = ?;
            """, (submission_date_str, submission_date_str, assignment_id))

            conn.commit()

            # Feedback to the user
            status = "Overdue" if submission_date > due_date else "Submitted"
            print(f"Assignment {assignment_id} updated successfully. Status: {status}")

        except pyodbc.Error as e:
            print(f"Database Error: {e}")
        except ValueError:
            print("Invalid input. Please enter the correct data format.")
        except Exception as e:
            print(f"Unexpected Error: {e}")
        finally:
            if conn:
                conn.close()

    @staticmethod
    def view_grades(connection_string, student_id):
        """
        View grades for the specified student ID.

        :param connection_string: Database connection string.
        :param student_id: ID of the student to fetch grades for.
        """
        print("View Grades")

        conn = None

        try:
            # Connect to the database
            conn = pyodbc.connect(connection_string)
            cursor = conn.cursor()

            # Get the CourseID
            while True:
                course_id_input = input("Enter your CourseID: ").strip()
                if not course_id_input.isdigit():
                    print("Invalid input. CourseID must be a positive number. Please try again.")
                else:
                    course_id = int(course_id_input)
                    break

            # Check if StudentID and CourseID exist
            cursor.execute("SELECT COUNT(*) FROM Enrollment WHERE StudentID = ? AND CourseID = ?",
                           (student_id, course_id))
            if cursor.fetchone()[0] == 0:
                print(f"No records found for StudentID {student_id} and CourseID {course_id}. Please check your inputs and try again.")
                return

            # Fetch grades for the given StudentID and CourseID
            query = """
                    SELECT s.FirstName, s.LastName, c.Title AS Course, 
                           g.Grade, g.Remarks
                    FROM dbo.Grades g
                    INNER JOIN dbo.Enrollment e ON g.EnrolleesID = e.EnrolleesID
                    INNER JOIN dbo.Course c ON g.CourseID = c.CourseID
                    INNER JOIN dbo.Students s ON e.StudentID = s.StudentID
                    WHERE e.StudentID = ? AND g.CourseID = ?;
                    """
            cursor.execute(query, (student_id, course_id))
            grades = cursor.fetchall()

            if not grades:
                print("No grades found for your StudentID and CourseID.")
                return

            # Display grades in a table
            table = PrettyTable()
            table.field_names = ["FirstName", "LastName", "Course", "Grade", "Remarks"]
            for grade in grades:
                table.add_row([grade.FirstName, grade.LastName, grade.Course, grade.Grade, grade.Remarks])
            print(table)

        except pyodbc.Error as e:
            print(f"Database Error: {e}")
        except Exception as e:
            print(f"Unexpected Error: {e}")
        finally:
            if conn:
                conn.close()



class Schedule:
    def __init__(self, schedule_id, days, start_time, end_time):
        #ScheduleID, StartTime, EndTime
        self.schedule_id = schedule_id
        self.days = days
        self.start_time = start_time
        self.end_time = end_time

    def insert_sched_db(self, connection_string):
        conn = None
        try:
            conn = DatabaseConnection.get_connection()
            cursor = conn.cursor()

            cursor.execute(
                "EXEC InsertIntoSchedule ?, ?, ?",
                self.days,
                self.start_time,
                self.end_time
            )
            conn.commit()
            print("You have successfully created a Schedule.")

        except pyodbc.Error as e:
            print(f"Database Error: {e}")

        except Exception as e:
            print(f"Unexpected Error: {e}")

        finally:
            if conn:
                conn.close()


    @staticmethod
    def show_all_schedule():
        conn = None
        try:
            conn = DatabaseConnection.get_connection()
            cursor = conn.cursor()

            cursor.execute("Select * FROM Schedule")
            schedules = cursor.fetchall()

            if schedules:
                table = PrettyTable()
                table.field_names = [
                    "ScheduleID", "Days", "StartTime", "EndTime"
                ]
                for schedule in schedules:
                    table.add_row(schedule)
                print(table)

            else:
                print("No Schedule Found in the Database")

        except pyodbc.Error as e:
            print(f"Database Error: {e}")
        except Exception as e:
            print(f"Unexpected Error: {e}")

        finally:
            if conn:
                conn.close()







