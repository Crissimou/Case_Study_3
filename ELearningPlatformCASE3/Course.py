from DataBaseConnection import  DatabaseConnection
import pyodbc
from prettytable import PrettyTable

class Course:
    def __init__(self, course_id, title, description, instructor_id, capacity, duration, price):
        self.course_id = course_id
        self.title = title
        self.description = description
        self.instructor_id = instructor_id
        self.capacity = capacity
        self.duration = duration
        self.price = price

    def add_course_db(self, connection_string):
        conn = None
        try:
            conn = DatabaseConnection.get_connection()
            cursor = conn.cursor()

            cursor.execute(
                "EXEC InsertIntoCourse ?, ?, ?, ?, ?, ?",
                self.title,
                self.description,
                self.instructor_id,
                self.capacity,
                self.duration,
                self.price
            )
            conn.commit()
            print("You have Successfully created a Course")

        except pyodbc.Error as e:
            print(f"Database Error: {e}")

        except Exception as e:
            print(f"Unexpected Error: {e}")

        finally:
            if conn:
                conn.close()


    @staticmethod
    def show_all_course():
        conn = None
        try:
            conn = DatabaseConnection.get_connection()
            cursor = conn.cursor()

            cursor.execute("Select * FROM Course")
            courses = cursor.fetchall()

            if courses:
                table = PrettyTable()
                table.field_names = [
                    "CourseID", "Title", "Description", "InstructorID", "Capacity", "Duration", "Price"
                ]

                for course in courses:
                    table.add_row(course)

                print(table)

            else:
                print("No course Found in Database")

        except pyodbc.Error as e:
            print(f"Database Error: {e}")

        except Exception as e:
            print(f"Unexpected Error: {e}")

        finally:
            if conn:
                conn.close()




