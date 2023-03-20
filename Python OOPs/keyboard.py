from item import Item

class Keyboard(Item):

    discount = 0.5

    def __init__(self, name : str, price : float, quantity = 0):
        
        # super() functions helps us inherit all the attributes already defined in the parent class and
        # we need not define them again in the child class
        super().__init__(
            name, price, quantity
        )