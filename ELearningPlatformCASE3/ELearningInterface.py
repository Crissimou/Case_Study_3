
from Admin import Admin
from Instructor import Instructor, Assignments, AssignGrade
from Student import Student
from Course import Course
from Enrollment import Enrollment, Schedule
import pyodbc
from prettytable import PrettyTable

class ElearningInterface:
    def __init__(self):
        self.__student = None  # Initialize to None; student will be created later
        self.__instructor = None
        self.__course = None
        self.__enrollment = None
        self.__schedule = None

#Student Functionalities
    def collect_student_data(self):
        print("Enter the student details:")
        first_name = input("First Name: ")
        last_name = input("Last Name: ")
        middle_name = input("Middle Name (leave blank if none): ") or None
        date_of_birth = input("Date of Birth (YYYY-MM-DD): ")
        age = int(input("Age: "))
        gender = input("Gender (leave blank if none): ") or None
        nationality = input("Nationality: ")
        ethnicity = input("Ethnicity (leave blank if none): ") or None
        address = input("Address: ")
        contact_number = input("Contact Number: ")
        email = input("Email: ")

        # Create a Student object with the collected information
        self.__student = Student(
            student_id=None,  # Auto-incremented in the database, can be left as None
            first_name=first_name,
            last_name=last_name,
            middle_name=middle_name,
            date_of_birth=date_of_birth,
            age=age,
            gender=gender,
            nationality=nationality,
            ethnicity=ethnicity,
            address=address,
            contact_number=contact_number,
            email=email
        )

    def save_student_to_db(self, connection_string):
        if self.__student:
            self.__student.add_student_db(connection_string)
        else:
            print("No student data available to save.")


#Instructor Functionalities
    def collect_instructor_data(self):
        print("Enter the instructor details:")
        first_name = input("First Name: ")
        last_name = input("Last Name: ")
        middle_name = input("Middle Name (leave blank if none): ") or None
        date_of_birth = input("Date of Birth (YYYY-MM-DD): ")
        age = int(input("Age: "))
        gender = input("Gender (leave blank if none): ") or None
        nationality = input("Nationality: ")
        ethnicity = input("Ethnicity (leave blank if none): ") or None
        address = input("Address: ")
        contact_number = input("Contact Number: ")
        email = input("Email: ")

        # Create a Student object with the collected information
        self.__instructor = Instructor(
            instructor_id=None,  # Auto-incremented in the database, can be left as None
            first_name=first_name,
            last_name=last_name,
            middle_name=middle_name,
            date_of_birth=date_of_birth,
            age=age,
            gender=gender,
            nationality=nationality,
            ethnicity=ethnicity,
            address=address,
            contact_number=contact_number,
            email=email,
        )

    def save_instructor_to_db(self, connection_string):
        if self.__instructor:
            self.__instructor.add_instructor_db(connection_string)
        else:
            print("No instructor data available to save.")

#Course Functionalities

    # "CourseID", "Title", "Description", "InstructorID", "Capacity", "Duration", "Price"
    def collect_course_data(self, instructor_id):
        print("Enter Course Details:")
        title = input("Course Title: ")
        description = input("Course Description: ")
        capacity = int(input("Course Capacity"))
        duration = input("Course Duration(e.g 1.2 hr): ")
        price = float(input("Course Price: "))

        self.__course = Course(
            course_id=None,
            title=title,
            description=description,
            instructor_id=instructor_id,
            capacity=capacity,
            duration=duration,
            price=price
        )

    def save_course_to_db(self, connection_string):
        if self.__course:
            self.__course.add_course_db(connection_string)
        else:
            print("No Course data is available to save.")

#Enrollment Functionalities
    # EnrolleesID, StudentID, CourseID, SchedulesID
    def enroll_student_data(self):
        print("Enter your StudentID and CourseID you want to Enroll: ")
        student_id = input("Enter your StudentID: ")
        course_id = input("Enter your CourseID: ")

        self.__enrollment = Enrollment(
            enrollees_id = None,
            student_id=student_id,
            course_id=course_id,
            schedule_id = None
        )

    def save_enrollee_to_db(self, connect_string):
        if self.__enrollment:
            self.__enrollment.enroll_student_db(connect_string)
        else:
            print("No Erolled Student data is available to save.")


    def add_schedule_data(self):
        print("Enter Schedule Details: ")
        days = input("Enter Days(e.g Monday, Tuesday, Wednesday.. )")
        start_time = input("Enter Start Time (00:00 - 12:00)")
        end_time = input("Enter End Time (13:00 - 24:00)")

        self.__schedule = Schedule(
            schedule_id=None,
            days = days,
            start_time = start_time,
            end_time = end_time
        )

    def save_schedule_to_db(self, connect_string):
        if self.__schedule:
            self.__schedule.insert_sched_db(connect_string)
        else:
            print("No Schedule data is available ")


class MyDemy:
    def __init__(self):
        self.connection_string = (
            "Driver={SQL Server};"
            "Server=LAPTOP-7BB7M9BR\\SQLEXPRESS;"
            "Database=ElearningPlatform;"
            "Trusted_Connection=yes;"
        )

    def admin_login(self):
        """
        Prompts the admin for username and password, validates them against the Admin table,
        and redirects to the admin menu if successful.
        """

        conn = None

        try:
            # Prompt for credentials
            username = input("Enter Admin Username: ").strip()
            password = input("Enter Admin Password: ").strip()

            # Connect to the database
            conn = pyodbc.connect(self.connection_string)
            cursor = conn.cursor()

            # Query to validate credentials
            query = "SELECT COUNT(*) FROM Admin WHERE Username = ? AND Password = ?"
            cursor.execute(query, (username, password))

            # Check if credentials are valid
            if cursor.fetchone()[0] > 0:
                print("Login successful! Redirecting to the Admin Menu...")
                self.admin_menu()
            else:
                print("Invalid username or password. Please try again.")

        except pyodbc.Error as e:
            print(f"Database Error: {e}")
        finally:
            if conn:
                conn.close()


    def admin_menu(self):
        while True:
            print("--- Admin Panel ---")
            print("1. View All Registered Person")
            print("2. View all Courses")
            print("3. View Enrollees")
            print("4. Delete Student")
            print("5. Delete Instructor")
            print("6. Register admin")
            print("7. Exit")
            choice = input("Enter your choice: ").strip()

            if choice == "1":
                Admin.view_all_person(self.connection_string)
            elif choice == "2":
                Course.show_all_course()
            elif choice == "3":
                Admin.view_all_enrollees(self.connection_string)
            elif choice == "4":
                Admin.delete_student(self.connection_string)
            elif choice == "5":
                Admin.delete_instructor(self.connection_string)
            elif choice == "6":
                Admin.register_admin(self.connection_string)
            elif choice == "7":
                break
            else:
                print("Invalid choice, please try again.")




    def student_menu(self):
        while True:
            print("Welcome Student!")
            print("1. Log-in")
            print("2. Register")
            print("3. Exit")
            choice = input("Enter your choice: ").strip()

            if choice == "1":
                self.student_login()
            elif choice == "2":
                self.register_student()
            elif choice == "3":
                break
            else:
                print("Invalid choice, please try again.")

    def student_login(self):
        student_id = input("Enter your StudentID: ").strip()
        first_name = input("Enter your First Name: ").strip()

        conn = None

        try:
            conn = pyodbc.connect(self.connection_string)
            cursor = conn.cursor()
            query = "SELECT COUNT(*) FROM Students WHERE StudentID = ? AND FirstName = ?"
            cursor.execute(query, (student_id, first_name))
            if cursor.fetchone()[0] > 0:
                self.student_actions(student_id)
            else:
                print("Invalid credentials. Please try again.")
        except pyodbc.Error as e:
            print(f"Database Error: {e}")
        finally:
            if conn:
                conn.close()

    def student_actions(self, student_id):

        while True:
            print("--- Student Actions ---")
            print("1. View All Courses")
            print("2. View All Enrolled Courses")
            print("3. Add to Cart")
            print("4. View Cart")
            print("5. Purchase Course")
            print("6. View Grades")
            print("7. View Asginments")
            print("8. Submit Assignment")
            print("9. Exit")
            choice = input("Enter your choice: ").strip()

            if choice == "1":
                Course.show_all_course()
            elif choice == "2":
                self.view_enrolled_courses(student_id)
            elif choice == "3":
                self.add_to_cart(student_id)
            elif choice == "4":
                self.view_cart(student_id)
            elif choice == "5":
                self.purchase_course(student_id)
            elif choice == "6":
                Enrollment.view_grades(self.connection_string, student_id)
            elif choice == "7":
                Enrollment.view_assignments(self.connection_string, student_id)
            elif choice == "8":
                Enrollment.update_assignment_submission(self.connection_string)
            elif choice == "9":
                break
            else:
                print("Invalid choice, please try again.")





    def view_enrolled_courses(self, student_id):
        """
        Displays all courses that a student is enrolled in using PrettyTable.
        """
        conn = None
        try:
            conn = pyodbc.connect(self.connection_string)
            cursor = conn.cursor()

            # Fetch enrolled courses for the given student
            query = """
            SELECT c.CourseID, c.Title, c.Description, c.Duration, c.Price, 
                   i.FirstName AS InstructorFirstName, i.LastName AS InstructorLastName
            FROM Enrollment e
            JOIN Course c ON e.CourseID = c.CourseID
            JOIN Instructors i ON c.InstructorID = i.InstructorID
            WHERE e.StudentID = ?
            """
            cursor.execute(query, student_id)
            enrolled_courses = cursor.fetchall()

            if not enrolled_courses:
                print("You are not enrolled in any courses.")
                return

            # Create a PrettyTable for displaying courses
            table = PrettyTable()
            table.field_names = [
                "CourseID",
                "Title",
                "Description",
                "Duration",
                "Price",
                "Instructor First Name",
                "Instructor Last Name"
            ]

            for course in enrolled_courses:
                table.add_row([
                    course.CourseID,
                    course.Title,
                    course.Description,
                    course.Duration,
                    f"PHP{course.Price:.2f}",
                    course.InstructorFirstName,
                    course.InstructorLastName
                ])

            print("Enrolled Courses:")
            print(table)

        except pyodbc.Error as e:
            print(f"Database Error: {e}")
        finally:
            if conn:
                conn.close()

    def add_to_cart(self, student_id):
        """
        Add a Course to the student's Cart
        """
        conn = None
        try:
            conn = pyodbc.connect(self.connection_string)
            cursor = conn.cursor()
            course_id = input("Enter the CourseID to add to your cart: ").strip()

            # Check if course exists
            cursor.execute("SELECT COUNT(*) FROM Course WHERE CourseID = ?", course_id)
            if cursor.fetchone()[0] == 0:
                print("Course does not exist.")
                return

            #Add course to the cart
            query = "INSERT INTO Cart (StudentID, CourseID) VALUES (?, ?)"
            cursor.execute(query,(student_id,course_id))
            conn.commit()
            print("Course added to cart successfully.")
        except pyodbc.Error as e:
            print(f"Database Error: {e}")
        finally:
            if conn:
                conn.close()



    def view_cart(self, student_id):
        print(f"Displaying cart items for StudentID {student_id}.")

        conn = None

        # Implement view cart logic
        try:
            conn = pyodbc.connect(self.connection_string)
            cursor = conn.cursor()
            query = """
            SELECT Cart.CourseID, Course.Title, Course.Price
            FROM Cart
            JOIN Course ON Cart.CourseID = Course.CourseID
            WHERE Cart.StudentID = ?
            """
            cursor.execute(query, student_id)
            cart_items = cursor.fetchall()

            if not cart_items:
                print("Your cart is empty.")
                return

            print("Your Cart:")
            for item in cart_items:
                print(f"CourseID: {item.CourseID}, Title: {item.Title}, Price: PHP{item.Price}")
        except pyodbc.Error as e:
            print(f"Database Error: {e}")
        finally:
            if conn:
                conn.close()

    def purchase_course(self, student_id):
        print(f"Processing purchase for StudentID {student_id}.")
        conn = None

        try:
            conn = pyodbc.connect(self.connection_string)
            cursor = conn.cursor()

            # Fetch courses in the cart
            query_cart = """
            SELECT Cart.CourseID, Course.Title, Course.Price
            FROM Cart
            JOIN Course ON Cart.CourseID = Course.CourseID
            WHERE Cart.StudentID = ?
            """
            cursor.execute(query_cart, student_id)
            cart_items = cursor.fetchall()

            if not cart_items:
                print("Your cart is empty.")
                return

            print("Courses in Your Cart:")
            table = PrettyTable()
            table.field_names = ["CourseID", "Title", "Price"]

            for cart in cart_items:
                table.add_row([cart.CourseID, cart.Title, f"PHP{cart.Price:.2f}"])
            print("Courses in Your Cart:")
            print(table)

            # Prompt the student to specify which courses to purchase
            course_id = input("Enter the CourseID of the course you want to purchase: ").strip()
            # Validate the selected courses
            cursor.execute(
                "SELECT CourseID, Title, Price FROM Course WHERE CourseID = ?", course_id
            )
            selected_course = cursor.fetchone()

            if not selected_course:
                print("Invalid CourseID. Please try again.")
                return

            # Process payment (simplified for this example)
            print(f"Course Selected: {selected_course.Title}")
            print(f"Price: PHP{selected_course.Price:.2f}")
            confirm_payment = input("Confirm purchase? (yes/no): ").strip().lower()

            if confirm_payment != "yes":
                print("Purchase canceled.")
                return

            # Add to Purchases table
            query_purchase = "INSERT INTO Purchases (StudentID, CourseID) VALUES (?, ?)"
            cursor.execute(query_purchase, (student_id, course_id))

            # Enroll the student
            query_enroll = "INSERT INTO Enrollment (StudentID, CourseID) VALUES (?, ?)"
            cursor.execute(query_enroll, (student_id, course_id))

            # Remove from cart
            query_remove = "DELETE FROM Cart WHERE StudentID = ? AND CourseID = ?"
            cursor.execute(query_remove, (student_id, course_id))

            conn.commit()
            print("Purchase successful! You are now enrolled in the selected courses.")

            # Prompt the student to create a schedule
            print("Next, please create a schedule for this course.")

            # Create an instance of ElearningInterface to call its methods
            elearning_interface = ElearningInterface()
            # Prompt to add schedule and save it to the database
            elearning_interface.add_schedule_data()
            elearning_interface.save_schedule_to_db(self.connection_string)


        except pyodbc.Error as e:
            print(f"Database Error: {e}")

        except Exception as e:
            print(f"Unexpected Error: {e}")

        finally:
            if conn:
                conn.close()

    # Implement student registration logic
    def register_student(self):
        print("Registering new student...")
        # Create an instance of ElearningInterface to call its methods
        register = ElearningInterface()
        # Prompt to add student and save it to the database
        register.collect_student_data()
        register.save_student_to_db(self.connection_string)

    def instructor_menu(self):
        while True:
            print("Welcome Instructor!")
            print("1. Log-in")
            print("2. Register")
            print("3. Exit")
            choice = input("Enter your choice: ").strip()

            if choice == "1":
                self.instructor_login()
            elif choice == "2":
                self.register_instructor()
            elif choice == "3":
                break
            else:
                print("Invalid choice, please try again.")

    def instructor_login(self):
        instructor_id = input("Enter your InstructorID: ").strip()
        first_name = input("Enter your First Name: ").strip()

        conn = None

        try:
            conn = pyodbc.connect(self.connection_string)
            cursor = conn.cursor()
            query = "SELECT COUNT(*) FROM Instructors WHERE InstructorID = ? AND FirstName = ?"
            cursor.execute(query, (instructor_id, first_name))
            if cursor.fetchone()[0] > 0:
                self.instructor_actions(instructor_id)
            else:
                print("Invalid credentials. Please try again.")
        except pyodbc.Error as e:
            print(f"Database Error: {e}")
        finally:
            if conn:
                conn.close()

    def register_instructor(self):
        print("Registering new instructor...")
        register = ElearningInterface()
        register.collect_instructor_data()
        register.save_instructor_to_db(self.connection_string)


    def instructor_actions(self, instructor_id):
        while True:
            print("--- Instructor Actions ---")
            print("1. Add Course")
            print("2. View Instructor's Course/s")
            print("3. Assign Assignment")
            print("4. Assign Grades")
            print("5. Exit")
            choice = input("Enter your choice: ").strip()

            if choice == "1":
                self.add_course(instructor_id)
            elif choice == "2":
                self.view_instuctor_courses(instructor_id)
            elif choice == "3":
                Assignments.assign_assignment(self.connection_string, instructor_id)
            elif choice == "4":
                AssignGrade.assign_grade(self.connection_string, instructor_id)
            elif choice == "5":
                break
            else:
                print("Invalid choice, please try again.")

    def add_course(self, instructor_id):
        print("Adding a new course...")
        addcourse = ElearningInterface()
        addcourse.collect_course_data(instructor_id)
        addcourse.save_course_to_db(self.connection_string)

    def view_instuctor_courses(self, instructor_id):
        print(f"All Courses of Instructor {instructor_id}")
        """
        Displays all courses that Instructor created.
        """
        conn = None
        try:
            conn = pyodbc.connect(self.connection_string)
            cursor = conn.cursor()

            # Fetch enrolled courses for the given student
            query = """
                SELECT dbo.Course.CourseID, dbo.Course.Title, dbo.Course.Description, dbo.Course.Duration, dbo.Course.Price
                FROM     dbo.Course INNER JOIN
                                  dbo.Instructors ON dbo.Course.InstructorID = dbo.Instructors.InstructorID
                                  WHERE dbo.Instructors.InstructorID = ?
                """
            cursor.execute(query, instructor_id)
            created_courses = cursor.fetchall()

            if not created_courses:
                print("You have not yet created any course.")
                return

            # Create a PrettyTable for displaying courses
            table = PrettyTable()
            table.field_names = [
                "CourseID",
                "Title",
                "Description",
                "Duration",
                "Price"
            ]

            for course in created_courses:
                table.add_row([
                    course.CourseID,
                    course.Title,
                    course.Description,
                    course.Duration,
                    f"PHP{course.Price:.2f}"
                ])

            print("Created Course:")
            print(table)

        except pyodbc.Error as e:
            print(f"Database Error: {e}")
        finally:
            if conn:
                conn.close()


    def run(self):
        while True:
            print("--- Welcome to MyDemy ---")
            print("1. Admin")
            print("2. Student")
            print("3. Instructor")
            print("4. Exit")
            choice = input("Enter your choice: ").strip()

            if choice == "1":
                self.admin_login()
            elif choice == "2":
                self.student_menu()
            elif choice == "3":
                self.instructor_menu()
            elif choice == "4":
                print("Thank you for using MyDemy!")
                break
            else:
                print("Invalid choice, please try again.")



# Example Usage
if __name__ == "__main__":
    platform = MyDemy()
    platform.run()