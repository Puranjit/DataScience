import csv
from os import read

# Defining a Parent class
class Item:

    discount = 0.8  # the pay rate after 20% discount
    all = []

    def __init__(self, name : str, price : float, quantity = 0):

        # Run validations to the received arguments
        assert price >= 0 # The price should always be greater than or equal to 0
        assert quantity >= 0 # The quantity should always be greater than or equal to 0     

        # Assign to self object
        self.__name = name
        self.__price = price
        self.quantity = quantity

        # Actions to execute
        Item.all.append(self)


    # ENCAPSULATION
    # refers to the mechanism of restricting the direct access of some attributes in a program
    # Getter's
    @property
    # property Decorator = Read-Only attribute
    def name(self):
        # print('You are trying to get an attribute')
        return self.__name

    # Setter's - here we insert the new value incase we want to update our value!!
    @name.setter
    def name(self, value):
        if len(value) > 10:
            raise Exception('The model name is too long!!')
        else:
            # print('You are trying to set an attribute!!!')
            self.__name = value

    def calculate_total_price(self):
        return self.__price*self.quantity

    @property
    def price(self):
        return self.__price

    def apply_discount(self):
        return self.__price * self.discount

    def apply_increment(self, increment_value):
        self.__price = self.__price + self.__price*increment_value
        return self.__price

    # ABSTRACTION
    # refers to the concept of only showing neccesary attributes/methods and hides the unnecessary information
    # abstracts the information such that it could not be called from an instance level

    def __connect_server(self): # Defining private methods that cannot be accesses at an instance level 
        pass

    def __connect_gmail(self):
        pass

    def __prepare_body(self): 
        return f"""
        Hello Customer,
        We have {self.quantity} {self.name}.
        Regard,
        Puran
        """

    def __send(self):
        pass

    def send_email(self): # Final method in which all the other private methods are called!!!
        self.__connect_server
        self.__connect_gmail
        self.__prepare_body
        self.__send

    @classmethod
    def instantiate_from_csv(cls):
        '''
            This should do something that has a relationship with the class, 
            but usually, those are used to manipulate different structures of data
            to instantiate objects, like we have done with CSV
        '''
        with open('items.csv', 'r') as f:
            reader = csv.DictReader(f)
            items = list(reader)

        for item in items:
            Item(
                name = item.get('name'),
                price = float(item.get('price')),
                quantity = int(item.get('quantity'))
            )

    @staticmethod
    def is_integer(num):
        '''
            This should do something that has a relationship with the class,
            but not something that must be unique per instance!!
        '''

        # We will count out the floats that are point zero
        if isinstance(num, float):
            # Count out the floats that are point zero
            # Eg.- 3.0, 5.0, 83.0
            return num.is_integer()
        elif isinstance(num, int):
            return True
        else:
            return False
        
    def __repr__(self):
        return f"{self.__class__.__name__}('{self.name}', '{self.__price}', '{self.quantity}')"
        
# print(Item.is_integer(44.9))
# print(Item.is_integer(44.0))