from Person import Person
from DataBaseConnection import DatabaseConnection
import pyodbc
from prettytable import PrettyTable

class Student(Person):
    def __init__(self, student_id, first_name, last_name, middle_name, date_of_birth, age, gender, nationality, ethnicity, address, contact_number, email):
        super().__init__(first_name, last_name, middle_name, date_of_birth, age, gender, nationality, ethnicity, address, contact_number, email)
        self._student_id = student_id

    def add_student_db(self, connection_string):
        conn = None
        try:
            # Establish the connection
            conn = DatabaseConnection.get_connection()
            cursor = conn.cursor()

            # Execute the stored procedure
            cursor.execute(
                "EXEC InsertStudent ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?",
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
                self.email
            )

            # Commit the transaction
            conn.commit()
            print("Student record inserted successfully.")

        except pyodbc.Error as e:
            print(f"Database Error: {e}")

        except Exception as e:
            print(f"Unexpected Error: {e}")

        finally:
            # Close the connection if it exists
            if conn:
                conn.close()


    @staticmethod
    def show_all_students():
        #Fetch and display all students in the student table.
        conn = None
        try:
            #Established the connection
            conn = DatabaseConnection.get_connection()
            cursor = conn.cursor()

            #execute the query to fetch all students
            cursor.execute("Select * FROM Students")
            students = cursor.fetchall()
            if students:
                #Define the table
                table = PrettyTable()
                table.field_names = [
                    "StudentID", "First Name", "Last Name", "Middle Name", "Date of Birth",
                    "Age", "Gender", "Nationality", "Ethnicity", "Address", "Contact Number", "Email"
                ]

                #Add rows to the table
                for student in students:
                    table.add_row(student)

                print(table)

            else:
                print("No Student Found in the Database")

        except pyodbc.Error as e:
            print(f"Database Error: {e}")

        except Exception as e:
            print(f"Unexpected Error: {e}")

        finally:
            #Close the connection if its exists
            if conn:
                conn.close()

