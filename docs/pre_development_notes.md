Assignment:
You are the lead programmer for a small chain of supermarkets. You are required to make a simple
cashier function that adds products to a cart and displays the total price.
You have the following test products registered:
Product code Name Price
GR1 Green tea £3.11
SR1 Strawberries £5.00
CF1 Coffee £11.23

Special conditions:
● The CEO is a big fan of buy-one-get-one-free offers and of green tea. He wants us to add a
rule to do this.
● The COO, though, likes low prices and wants people buying strawberries to get a price
discount for bulk purchases. If you buy 3 or more strawberries, the price should drop to £4.50
● The CTO is a coffee addict. If you buy 3 or more coffees, the price of all coffees should drop
to two thirds of the original price.
Our check-out can scan items in any order, and because the CEO and COO change their minds
often, it needs to be flexible regarding our pricing rules.
The interface to our checkout looks like this (shown in ruby):

co = Checkout.new(pricing_rules)
co.scan(item)
co.scan(item)
price = co.total
Implement a checkout system that fulfills these requirements.

Test data:
Basket: GR1,SR1,GR1,GR1,CF1
Total price expected: £22.45
Basket: GR1,GR1
Total price expected: £3.11
Basket: SR1,SR1,GR1,SR1
Total price expected: £16.61
Basket: GR1,CF1,SR1,CF1,CF1
Total price expected: £30.57

====================================================
Thoughts:

“
co = Checkout.new(pricing_rules)
co.scan(item)
co.scan(item)
price = co.total
"

this block suggest a Checkout service object as main service processor
the multiple scan method suggest an array build that should be stored. On checkout has mulitple itme, as a realy life, on checkout instance has multipile itmes in the array also multiple price objects.
also suggest because the pricing_rules has passed as attribte that is not a nested service class that is implemnted in this main file, 
and refers a service - business logic
the total is on class is on the checkout so maybe a Calculator class basd on the rules...

The item object has to load a yml, sotre the provided porduct table (also yml or short list) and the object built based on the code, and the fetch the related name and price. The final array sotre list of items objects in the Checkout object

sturcutre more like

This block has to be include :
“
co = Checkout.new(pricing_rules)
co.scan(item)
co.scan(item)
price = co.total
“

In the checkout we need the load the file and use an Item class with 3 parameters product_code, name and price. The scan method build up the item object and put into an array, probably defined as empty on the Checkout initializer. 

The price rules has to be assigned "or not”, so kind of dinamic implementation required. Probaly inside the Checkout, becuase the data has to be passed as paramter, we do not want same data dive down on the class levels...

When all of the item cheked, maybe pased as an array on the beginning we can calculate the price.

Probably I BDD based develpment plan and Functional test based TDD development process is ideal...