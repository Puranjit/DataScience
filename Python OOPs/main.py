from item import Item
from phone import Phone
from keyboard import Keyboard

Item.instantiate_from_csv()
# print(Item.all)

print('First instance')
item1 = Item('iPhone', 120000)
# item1.price = -900
# print(item1.name)
# print(item1.price)
print(Item.all)
print(item1.apply_discount())

# item1.__connect_gmail()

# INHERITANCE
print('Second instance')
# is the mechanism that allows us to reuse our code across classes
Phone.instantiate_from_csv()
item2 = Phone('iPhone13ProMax', 150000, 2)
print(Phone.all)
print(item2.apply_discount())

# POLYMORPHISM
print('Third instance')
item3 = Keyboard('iPhone X', 69000, 5)
print(item3.apply_discount())
print(item3.apply_increment(10))
