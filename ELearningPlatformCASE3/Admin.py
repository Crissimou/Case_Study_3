import pyodbc
from prettytable import PrettyTable

class Admin:

    @staticmethod
    def register_admin(connection_string):
        """
        Registers a new admin by inserting their credentials into the Admin table.
        """
        conn = None

        try:
            # Connect to the database
            conn = pyodbc.connect(connection_string)
            cursor = conn.cursor()

            # Prompt for admin details
            username = input("Enter a unique Admin Username: ").strip()
            password = input("Enter Admin Password: ").strip()
            confirm_password = input("Confirm Admin Password: ").strip()

            # Check if passwords match
            if password != confirm_password:
                print("Passwords do not match. Please try again.")
                return


            # Check if username already exists
            query_check = "SELECT COUNT(*) FROM Admin WHERE userName = ?"
            cursor.execute(query_check, (username,))
            if cursor.fetchone()[0] > 0:
                print("Username already exists. Please choose a different username.")
                return

            # Insert the new admin into the Admin table
            query_insert = "INSERT INTO Admin (userName, password) VALUES (?, ?)"
            cursor.execute(query_insert, (username, confirm_password))
            conn.commit()

            print("Admin registered successfully!")

        except pyodbc.Error as e:
            print(f"Database Error: {e}")
        finally:
            if conn:
                conn.close()

    @staticmethod
    def view_all_person(connection_string):
        """
        Displays all persons (students and instructors) with their IDs, first name, last name, and role.
        """
        conn = None
        try:
            conn = pyodbc.connect(connection_string)
            cursor = conn.cursor()

            query = """
            SELECT StudentID AS ID, FirstName, LastName, 'Student' AS Role FROM Students
            UNION ALL
            SELECT InstructorID AS ID, FirstName, LastName, 'Instructor' AS Role FROM Instructors
            """
            cursor.execute(query)

            rows = cursor.fetchall()
            if rows:
                table = PrettyTable(["ID", "First Name", "Last Name", "Role"])
                for row in rows:
                    table.add_row(row)
                print(table)
            else:
                print("No records found.")
        except pyodbc.Error as e:
            print(f"Database Error: {e}")
        finally:
            if conn:
                conn.close()

    @staticmethod
    def view_all_enrollees(connection_string):
        """
        Displays all enrollees with their IDs, first name, last name, and course.
        """
        conn = None
        try:
            conn = pyodbc.connect(connection_string)
            cursor = conn.cursor()

            query = """
            SELECT 
                e.EnrolleesID, 
                s.FirstName, 
                s.LastName, 
                c.Title
            FROM 
                Enrollment e
            INNER JOIN 
                Students s ON e.StudentID = s.StudentID
            INNER JOIN 
                Course c ON e.CourseID = c.CourseID
            """
            cursor.execute(query)

            rows = cursor.fetchall()
            if rows:
                table = PrettyTable(["EnrolleesID", "First Name", "Last Name", "Course"])
                for row in rows:
                    table.add_row(row)
                print(table)
            else:
                print("No enrollees found.")
        except pyodbc.Error as e:
            print(f"Database Error: {e}")
        finally:
            if conn:
                conn.close()

    @staticmethod
    def delete_student(connection_string):
        """
        Deletes a student based on their ID from the Students table.
        """
        conn = None
        try:
            conn = pyodbc.connect(connection_string)
            cursor = conn.cursor()

            student_id = input("Enter the StudentID to delete: ").strip()
            query = "DELETE FROM Students WHERE StudentID = ?"
            cursor.execute(query, (student_id,))
            conn.commit()

            print(f"Student with ID {student_id} has been deleted.")
        except pyodbc.Error as e:
            print(f"Database Error: {e}")
        finally:
            if conn:
                conn.close()

    @staticmethod
    def delete_instructor(connection_string):
        """
        Deletes an instructor based on their ID from the Instructors table.
        """
        conn = None
        try:
            conn = pyodbc.connect(connection_string)
            cursor = conn.cursor()

            instructor_id = input("Enter the InstructorID to delete: ").strip()
            query = "DELETE FROM Instructors WHERE InstructorID = ?"
            cursor.execute(query, (instructor_id,))
            conn.commit()

            print(f"Instructor with ID {instructor_id} has been deleted.")
        except pyodbc.Error as e:
            print(f"Database Error: {e}")
        finally:
            if conn:
                conn.close()




