###Airport_Challenge - Weekend challenge for Week 1###

##Approach to solving the challenge##

- First step was going through the user stories and picking out the details that made most sense to turn into classes and methods

| Class   | Method      |
|---------|-------------|
| Plane   | take_off    |
|         |  land       |
|         |  at_airport?|
| Airport | capacity    |
|         |  full?      |
| Weather |             |

- I then created an Airport class (which initialized with an empty array) and a plane class. New instances of the plane class could be created and landed in the airport with the 'land' method, which would add the plane to the array. The 'take_off' method would remove the plane from the array and announce that it had left.
- I created a weather class with idea being that I would generate a number from 1-6 and then if the number 6 was generated, the weather would be considered to be stormy. However, I struggled to implement this and also had trouble getting the methods from the weather class to work inside the Airport class.
- I wanted to add a line to the take_off and land methods that would throw an error message if the weather was stormy. Figuring out how to call methods between classes is something that I need to work on next week.
