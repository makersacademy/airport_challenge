=================
Airport Challenge
=================

Summary

After using Rspec for the first time this week, Makers set us a weekend challenge to get to grips with the program, the process of TDD as well as concepts such as high class cohesion and low coupling. We were asked to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we were given by Makers:

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

We were also asked to account for edge cases, such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.


My Approach
---------
* I started by breaking down the user stories into diagrams of objects and messages
* Then I created the Airport and Plane classes
* The methods were predictably #land and #take_off. I put both in the Airport class.
* I also created #weather_reporter which generated random weather using #rand from inside the Airport class.
* (Doing it again I would have a Weather class, with #weather_reporter inside, for higher coherance)
* Following the models I created from the user stories, I used Rspec to test for expected object states and messages using doubles and stubs.
* These tests drove the design of my program, as it emerged iteratively, test-by-test
* I satisfied each of the user stories during feature tests, but have not been able to replicate all the outcomes in Rspec
* I also did not have time to account for the edge cases


Instructions
---------
1. Run 'airport.rb' in irb, pry etc.
2. You can create a new plane with 'plane = Plane.new'
3. New airports are created with 'airport = Airport.new'
4. Airports can receive the #land #take_off methods with an instance of plane as a parameter e.g. 'airport.land(plane)'
5. Random weather is generated with #weather_reporter
6. Planes cannot take off or land if the weather is stormy
7. Successfully landed planes are stored in the @plane array
8. The capacity for array is set at 5
9. If you try to land more planes than this you will receive a decline message and your plane will not be landed
10. However you can change the airport capacity with #change_capacity


Feature Test for Weather Dependant Landing
---------
```
2.5.0 :003 > airport = Airport.new
 => #<Airport:0x00007fe0a40dab88 @plane=[], @capacity=5> 
2.5.0 :004 > plane = Plane.new
 => #<Plane:0x00007fe0a40ceea0> 
2.5.0 :005 > airport.land(plane)
"Stormy"
"The weather is too stormy, you cannot land"
 => nil 
2.5.0 :006 > airport.land(plane)
"Sunny"
 => [#<Plane:0x00007fe0a40ceea0>] 
```

Feature Test for Airport Receiving, Remembering and Removing Planes
---------
This shows the array at 5 (default capacity) at the beginning and showing 2 remaining after calling #take_off 3 times.
```
2.5.0 :012 > airport.land(plane)
"Sunny"
 => [#<Plane:0x00007fd3551c9eb0>, #<Plane:0x00007fd3551c9eb0>, #<Plane:0x00007fd3551c9eb0>, #<Plane:0x00007fd3551c9eb0>, #<Plane:0x00007fd3551c9eb0>] 
2.5.0 :013 > airport.land(plane)
"Sunny"
"This airport is full, you cannot land here"
 => "This airport is full, you cannot land here" 
2.5.0 :014 > airport.take_off(plane)
"Sunny"
"The weather is sunny, safe to take off. The plane has successfully left the airport"
 => #<Plane:0x00007fd3551c9eb0> 
2.5.0 :015 >  airport.take_off(plane)
"Sunny"
"The weather is sunny, safe to take off. The plane has successfully left the airport"
 => #<Plane:0x00007fd3551c9eb0> 
2.5.0 :016 >  airport.take_off(plane)
"Stormy"
"The weather is too stormy, you cannot take off"
 => "The weather is too stormy, you cannot take off" 
2.5.0 :017 >  airport.take_off(plane)
"Sunny"
"The weather is sunny, safe to take off. The plane has successfully left the airport"
 => #<Plane:0x00007fd3551c9eb0> 
2.5.0 :018 > airport.plane
 => [#<Plane:0x00007fd3551c9eb0>, #<Plane:0x00007fd3551c9eb0>] 
```



Feature Test for Airport Capacity Stopping #land
---------
```
2.5.0 :011 > airport.land(plane)
"Sunny"
 => [#<Plane:0x00007fe0a40ceea0>, #<Plane:0x00007fe0a40ceea0>, #<Plane:0x00007fe0a40ceea0>, #<Plane:0x00007fe0a40ceea0>, #<Plane:0x00007fe0a40ceea0>] 
2.5.0 :012 > airport.land(plane)
"Stormy"
"The weather is too stormy, you cannot land"
 => nil 
2.5.0 :013 > airport.land(plane)
"Sunny"
"This airport is full, you cannot land here"
 => "This airport is full, you cannot land here" 
2.5.0 :014 > 
```

Feature Test for Setting Airport Capacity
---------
```
2.5.0 :015 > airport.capacity
 => 5 
2.5.0 :016 > airport.change_capacity
"What number would you like to set this airport's capacity to?"
"Press enter to skip and use default capacity of 5"
10
10
 => 10 
2.5.0 :017 > airport.capacity
 => 10 
```


