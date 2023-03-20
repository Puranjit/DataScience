from item import Item
import csv

# Defining a Child class
class Phone(Item):

    all = []
    discount = 0.1

    def __init__(self, name : str, price : float, quantity = 0, broken_phones = 0):
        
        # super() functions helps us inherit all the attributes already defined in the parent class and
        # we need not define them again in the child class
        super().__init__(
            name, price, quantity
        )
        
        # Run validations to the received arguments
        assert broken_phones >= 0 # The number of broken phones should always be greater than or equal to 0

        # Assign to self object
        self.broken_phones = broken_phones

        Phone.all.append(self)
    
    @classmethod
    def instantiate_from_csv(cls):
        '''
            This should do something that has a relationship with the class, 
            but usually, those are used to manipulate different structures of data
            to instantiate objects, like we have done with CSV
        '''
        with open('phones.csv', 'r') as f:
            reader = csv.DictReader(f)
            phones = list(reader)

        for phone in phones:
            Phone(
                name = phone.get('name'),
                price = float(phone.get('price')),
                quantity = int(phone.get('quantity')),
                broken_phones = int(phone.get('broken_phones'))
            )

    def __repr__(self):
        return f"{self.__class__.__name__}('{self.name}', '{self.price}', '{self.quantity}', '{self.broken_phones}')"