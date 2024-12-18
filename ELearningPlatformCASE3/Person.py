from abc import ABC

class Person(ABC):
    def __init__(self,  first_name, last_name, middle_name, date_of_birth, age, gender, nationality, ethnicity, address, contact_number, email):
        self.first_name = first_name
        self.last_name = last_name
        self.middle_name = middle_name
        self.date_of_birth = date_of_birth
        self.age = age
        self.gender = gender
        self.nationality = nationality
        self.ethnicity = ethnicity
        self.address = address
        self.contact_number = contact_number
        self.email = email


