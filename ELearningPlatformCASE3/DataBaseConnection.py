import pyodbc

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