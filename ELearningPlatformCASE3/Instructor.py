from Person import Person
from DataBaseConnection import DatabaseConnection
import pyodbc
from prettytable import PrettyTable
from datetime import datetime

class Instructor(Person):
    def __init__(self, instructor_id, first_name, last_name, middle_name, date_of_birth, age, gender, nationality, ethnicity, address, contact_number, email):
        super().__init__(first_name, last_name, middle_name, date_of_birth, age, gender, nationality, ethnicity, address, contact_number, email)
        self._instructor_id = instructor_id

    def add_instructor_db(self, connection_string):
        conn = None
        try:
            conn = DatabaseConnection.get_connection()
            cursor = conn.cursor()

            cursor.execute(
                "EXEC InsertInstructor ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?",
                self.first_name,
                self.last_name,
                self.middle_name,
                self.date_of_birth,
                self.age,
                self.gender,
                self.nationality,
                self.ethnicity,
                self.address,
                self.contact_number,
                self.email,
            )
            conn.commit()
            print("Instructor record inserted successfully.")

        except pyodbc.Error as e:
            print(f"Database Error: {e}")

        except Exception as e:
            print(f"Unexpected Error: {e}")

        finally:
            if conn:
                conn.close()

    @staticmethod
    def show_all_instructors():
        conn = None
        try:
            conn = DatabaseConnection.get_connection()
            cursor = conn.cursor()

            cursor.execute("Select * From Instructors")
            instructors = cursor.fetchall()
            if instructors:
                table = PrettyTable()
                table.field_names = [
                    "InstructorID", "First Name", "Last Name", "Middle Name", "Date of Birth",
                    "Age", "Gender", "Nationality", "Ethnicity", "Address", "Contact Number", "Email"
                ]

                for instructor in instructors:
                    table.add_row(instructor)

                print(table)

            else:
                print("No Instructor Found in the Database")

        except pyodbc.Error as e:
            print(f"Database Error: {e}")
        except Exception as e:
            print(f"Unexpected Error: {e}")

        finally:
            if conn:
                conn.close()


class Assignments:

    @classmethod
    def assign_assignment(cls, connection_string, instructor_id):
        print("Assign an Assignment")

        conn = None

        try:
            # Connect to the database
            conn = pyodbc.connect(connection_string)
            cursor = conn.cursor()

            # Prompt for CourseID
            course_id = int(input("Enter CourseID: "))

            # Check if the CourseID exists and is assigned to the instructor
            cursor.execute("""
            SELECT COUNT(*) 
            FROM Course 
            WHERE CourseID = ? AND InstructorID = ?;
            """, (course_id, instructor_id))
            if cursor.fetchone()[0] == 0:
                print(f"CourseID {course_id} is not assigned to you or does not exist.")
                return

            # Fetch all students enrolled in the course
            cursor.execute("""
            SELECT EnrolleesID 
            FROM Enrollment 
            WHERE CourseID = ?;
            """, (course_id,))
            enrolled_students = cursor.fetchall()

            if not enrolled_students:
                print(f"No students are enrolled in CourseID {course_id}.")
                return

            # Collect assignment details
            title = input("Enter Assignment Title: ")
            description = input("Enter Assignment Description: ")
            due_date = input("Enter Due Date (YYYY-MM-DD): ")

            # Validate Due Date
            try:
                datetime.strptime(due_date, '%Y-%m-%d')
            except ValueError:
                print("Invalid date format. Please use YYYY-MM-DD.")
                return

            status = "Pending"

            # Insert assignment for each enrolled student
            query = """
            INSERT INTO Assignments (EnrolleesID, CourseID, Title, Description, DueDate, Status)
            VALUES (?, ?, ?, ?, ?, ?);
            """
            for student in enrolled_students:
                cursor.execute(query, (student.EnrolleesID, course_id, title, description, due_date, status))

            conn.commit()
            print("Assignment has been successfully assigned to all enrolled students.")

        except pyodbc.Error as e:
            print(f"Database Error: {e}")
        except ValueError as e:
            print(f"Input Error: {e}")
        except Exception as e:
            print(f"Unexpected Error: {e}")
        finally:
            if conn:
                conn.close()


class AssignGrade:
    @classmethod
    def assign_grade(cls, connection_string, instructor_id):
        print("Assign Grades to Enrolled Students")

        conn = None

        try:
            # Connect to the database
            conn = pyodbc.connect(connection_string)
            cursor = conn.cursor()

            # Prompt for the CourseID
            course_id = int(input("Enter CourseID: "))

            # Verify the course is assigned to the instructor
            cursor.execute("""
            SELECT COUNT(*) 
            FROM Course 
            WHERE CourseID = ? AND InstructorID = ?;
            """, (course_id, instructor_id))
            if cursor.fetchone()[0] == 0:
                print(f"CourseID {course_id} is not assigned to you or does not exist.")
                return

            # Fetch and display enrolled students
            cursor.execute("""
                SELECT dbo.Enrollment.EnrolleesID, dbo.Students.FirstName, dbo.Students.LastName
                FROM     dbo.Course INNER JOIN
                                  dbo.Enrollment ON dbo.Course.CourseID = dbo.Enrollment.CourseID INNER JOIN
                                  dbo.Students ON dbo.Enrollment.StudentID = dbo.Students.StudentID
                
                                  WHERE dbo.Course.CourseID = ?;
            """, (course_id,))
            enrolled_students = cursor.fetchall()

            if not enrolled_students:
                print(f"No students are enrolled in CourseID {course_id}.")
                return

            print("\n--- Enrolled Students ---")
            for student in enrolled_students:
                print(f"EnrolleesID: {student.EnrolleesID}, Name: {student.FirstName}")
            print("-------------------------")

            # Prompt for EnrolleesID(s) and grades
            while True:
                try:
                    enrollees_id = int(input("Enter EnrolleesID to assign a grade (or type 0 to finish): "))
                    if enrollees_id == 0:
                        break

                    # Verify the EnrolleesID belongs to the course
                    if not any(student.EnrolleesID == enrollees_id for student in enrolled_students):
                        print(f"EnrolleesID {enrollees_id} is not enrolled in CourseID {course_id}.")
                        continue

                    # Input grade
                    grade = float(input(f"Enter Grade for EnrolleesID {enrollees_id} (0-100): "))
                    if grade < 0 or grade > 100:
                        print("Grade must be between 0 and 100.")
                        continue

                    # Optional remarks
                    remarks = input("Enter Remarks (optional): ")

                    # Insert grade record
                    query = """
                    INSERT INTO Grades (EnrolleesID, CourseID, Grade, Remarks)
                    VALUES (?, ?, ?, ?);
                    """
                    cursor.execute(query, (enrollees_id, course_id, grade, remarks))
                    conn.commit()

                    print(f"Grade successfully assigned to EnrolleesID {enrollees_id}.")
                except ValueError:
                    print("Invalid input. Please enter a valid number.")

            print("Grade assignment process completed.")

        except pyodbc.Error as e:
            print(f"Database Error: {e}")
        except ValueError as e:
            print(f"Input Error: {e}")
        except Exception as e:
            print(f"Unexpected Error: {e}")
        finally:
            if conn:
                conn.close()