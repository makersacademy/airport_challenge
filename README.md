Airport Challenge
=================

This repository features my solution to the first weekend challenge at Makers Academy. The brief was to write software which controlled the flow of planes at an airport.  

I have used three seperate classes; Aiport, Plane and Weather to encapsulate the objects. The Aiport class contains an array (planes) where a record of planes landed at each airport is stored. When the plane leaves the aiport, it is removed from the array.

The user can create new Aiports and assign to variables e.g. 
```
heathrow = Airport.new(60) 
```
The argument specifies the number of aeroplanes that can land at the aiport, if no argument is given, the new airport will use the default capacity of 50.

The user can also create planes and assign to variables e.g 
```
airbus_a380 = Plane.new. 
```
Planes can be landed at airports using the land method e.g. 
```
heathrow.land(airbus_a380) 
```
and leave using the take_off method e.g  
```
heathrow.land(airbus_a380)
```
No planes are allowed to land or take off in a storm. Weather is generated in the Weather class for each aiport, using the storm? method which gives a one in four chance of the method returing true for a storm. The weather at an airport can be checked using the message:
```
heathrow.weather.storm?
```
Which will return false if the weather is clear for landing or take off.

The approach uses TDD in response to the various user stories and edge cases described below. The testing framework allso includes an RSpec feature test that lands three different planes at three different aiports and checks they have landed. It then instructs them to take off and checks they are no longer in the aiport.

The formatting of the code has been tested with Rubocop for consistency.

#### User Stories
```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

Your code should defend against [edge cases](http://programmers.stackexchange.com/questions/125587/what-are-the-difference-between-an-edge-case-a-corner-case-a-base-case-and-a-b) such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.




