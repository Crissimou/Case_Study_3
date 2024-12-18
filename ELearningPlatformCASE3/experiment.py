import pyodbc
from datetime import datetime

# Database connection setup
class DatabaseConnection:
    @staticmethod
    def get_connection():
        try:
            conn = pyodbc.connect(
                "Driver={SQL Server};"
                "Server=LAPTOP-7BB7M9BR\\SQLEXPRESS;"
                "Database=ElearningPlatform;"
                "Trusted_Connection=yes;"
            )
            return conn
        except pyodbc.Error as e:
            print("Error connecting to database:", e)
            return None

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
                query = "SELECT * FROM Students"
                cursor.execute(query)
                rows = cursor.fetchall()
                print("Student Records:")
                for row in rows:
                    print(f"ID: {row.StudentID}, Name: {row.FirstName} {row.LastName}, Email: {row.Email}")
            except pyodbc.Error as e:
                print("Error fetching students:", e)
            finally:
                conn.close()

# Course Management
class CourseManager:
    def add_course(self, course_name, description, credits, instructor_id, schedule_id):
        conn = DatabaseConnection.get_connection()
        if conn:
            try:
                cursor = conn.cursor()
                query = "INSERT INTO Courses (CourseName, Description, Credits, InstructorID, ScheduleID) VALUES (?, ?, ?, ?, ?)"
                cursor.execute(query, (course_name, description, credits, instructor_id, schedule_id))
                conn.commit()
                print(f"Course '{course_name}' added successfully.")
            except pyodbc.Error as e:
                print("Error adding course:", e)
            finally:
                conn.close()

# Enrollment Management
class EnrollmentManager:
    def enroll_student(self, student_id, course_id):
        conn = DatabaseConnection.get_connection()
        if conn:
            try:
                cursor = conn.cursor()
                query = "INSERT INTO Enrollments (StudentID, CourseID, DateEnrolled) VALUES (?, ?, GETDATE())"
                cursor.execute(query, (student_id, course_id))
                conn.commit()
                print(f"Student ID {student_id} enrolled in Course ID {course_id} successfully.")
            except pyodbc.Error as e:
                print("Error enrolling student:", e)
            finally:
                conn.close()

# Instructor Management
class InstructorManager:
    def assign_instructor(self, course_id, instructor_id):
        conn = DatabaseConnection.get_connection()
        if conn:
            try:
                cursor = conn.cursor()
                query = "UPDATE Courses SET InstructorID = ? WHERE CourseID = ?"
                cursor.execute(query, (instructor_id, course_id))
                conn.commit()
                print(f"Instructor ID {instructor_id} assigned to Course ID {course_id} successfully.")
            except pyodbc.Error as e:
                print("Error assigning instructor:", e)
            finally:
                conn.close()

# Grade Management
class GradeManager:
    def assign_grade(self, student_id, course_id, grade):
        conn = DatabaseConnection.get_connection()
        if conn:
            try:
                cursor = conn.cursor()
                query = "INSERT INTO Grades (StudentID, CourseID, Grade, DateAssigned) VALUES (?, ?, ?, GETDATE())"
                cursor.execute(query, (student_id, course_id, grade))
                conn.commit()
                print(f"Grade '{grade}' assigned to Student ID {student_id} for Course ID {course_id} successfully.")
            except pyodbc.Error as e:
                print("Error assigning grade:", e)
            finally:
                conn.close()

# Relationships between Managers
class ElearningPlatform:
    def __init__(self):
        self.user_manager = UserManager()
        self.course_manager = CourseManager()
        self.enrollment_manager = EnrollmentManager()
        self.instructor_manager = InstructorManager()
        self.grade_manager = GradeManager()

# Example Usage
if __name__ == "__main__":
    platform = ElearningPlatform()

    # # Add a new student
    # platform.user_manager.add_student("Alice", "Smith", "alice.smith@example.com")

    # Fetch all students
    platform.user_manager.fetch_students()

    # # Add a new course
    # platform.course_manager.add_course("Python Programming", "Learn Python basics and advanced concepts", 3, 1, 1)
    #
    # # Enroll a student in a course
    # platform.enrollment_manager.enroll_student(1, 1)
    #
    # # Assign an instructor to a course
    # platform.instructor_manager.assign_instructor(1, 2)
    #
    # # Assign a grade to a student
    # platform.grade_manager.assign_grade(1, 1, "A")
