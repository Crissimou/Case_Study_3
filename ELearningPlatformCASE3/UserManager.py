from DataBaseConnection import DatabaseConnection
import pyodbc

# User Management
class UserManager:
    def add_student(self, first_name, last_name, email):
        conn = DatabaseConnection.get_connection()
        if conn:
            try:
                cursor = conn.cursor()
                query = "INSERT INTO Students (FirstName, LastName, Email, EnrollmentDate) VALUES (?, ?, ?, GETDATE())"
                cursor.execute(query, (first_name, last_name, email))
                conn.commit()
                print(f"Student '{first_name} {last_name}' added successfully.")
            except pyodbc.Error as e:
                print("Error adding student:", e)
            finally:
                conn.close()

    def fetch_students(self):
        conn = DatabaseConnection.get_connection()
        if conn:
            try:
                cursor = conn.cursor()
                query = "SELECT s.StudentID, p.FirstName, p.LastName, p.Email FROM Person p INNER JOIN Students s ON  p.PersonID = s.StudentID;"
                cursor.execute(query)
                rows = cursor.fetchall()
                print("Student Records:")
                for row in rows:
                    print(f"ID: {row.StudentID}, Name: {row.FirstName} {row.LastName}, Email: {row.Email}")
            except pyodbc.Error as e:
                print("Error fetching students:", e)
            finally:
                conn.close()
