# AIRPORT-CHALLENGE

Right now:
We can crete an airport:
```
Airport.new
```
with default capacity of 5 but can be overriden. With a random weather and a planes array.
```
Airport.new(100)
```
We can create planes:
```
Plane.new
```
We can land a plane:
```
airport = Airport.new
plane = Plane.new
airport.land(plane)
```
We can have different results:
- receive an error message when the plane is already in the airport/not possible to land
- receive an error message when the weather is stormy/not possible to land
- receive an error message when the airport is at full capacity/not possible to land
- land successfully  

We can have a plane take off:
```
airport.take_off(plane)
```
It also can have different results:
- receive an error message when the weather is stormy
- receive an error message when the plane is not in the airport
- take off successfully

extra methods:
```
weather_stormy?
full_capacity?
```
used inside the land and take off methods.

---

First steps taken:

Read quickly all user stories and then start with first one.

_As an air traffic controller   
So I can get passengers to a destination  
I want to instruct a plane to land at an airport_  

NOUNS —> ACTIONS
Traffic controller
Passengers
Destination
Plane —> Land
Airport

Plane <—> Land <—> Airport

```

IRB
airport.land_plane (NameError uninitialised local variable or method airplane)
airport = Airport.new (NameError uninitialised constant Airport

```

Run rspec —> 100% coverage 0/0 lines

Start writing test

(created airplane_spec file)

Create first test for the user story

```

describe Airport do
    it { is_expected.to respond_to :land_plane }
end

```

Run rspec and receive NameError uninitialised constant Airplane (1 error occurred outside of examples)
Coverage: 50%

Time to create the Airport class in lib/Airplane.rb  
Run rspec (same error)  
Connect the test with the class file with “require”  
Run rspec  
1 example/ 1 failure - Coverage: 100% (method land_plane still not created)  
After creating the method  
1 example, 0 failure - Coverage 100%
Test again in IRB

```

3.0.2 :001 > airport = Airport.new
 => <Airport:0x000000014ea8b2f0> 
3.0.2 :002 > airport.land_plane
 => nil 
3.0.2 :003 > 

```

The plane lands in the airport so in a way is “stored” temporary in the airport.  
We’re missing the Plane object according to our graphic:  
 Plane <—> Land <—> Airport  
Create the class Plane.  

---
_As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport_

1- I want to instruct a plane to take off from an airport
IRB - airport.plane_take_off (NameError at first)

2- confirm that it is no longer in the airport
we should expect from running airport.plane_take_off to receive a message that says “The plane is no longer in the airport”

1- Created new test in airport_spec.rb . Checks that Airport respond_to the method plane_take_off. 
Rspec:
2 examples, 1 failure - Coverage 90%
Added the method plane_take_off in airport.rb and now with rspec:
2 exemples, 0 failures - Coverage 100%

2- Created test that expects a string with "The plane is no longer in the airport"
Rspec: 3 examples, 1 failure
Added "The plane is no longer in the airport" in the plane_take_off method. Which it doesn’t really check if the plane is really there or not but only returns a message atm.
Rspec: 3 examples, 0 failures (no logic yet)
Tests in IRB.

Will adjust through the user stories, I don’t wan to add extra stuff if not necessary.

--- 
_As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full_

Now the airport needs an array to represent the fact that can contains many planes. 
planes = []
We need to add more logic now.

```

IRB - 3.0.2 :001 > airport = Airport.new
 => #<Airport:0x000000012b2a6968> 
3.0.2 :002 > airport.land_plane
 => nil 
3.0.2 :003 > 
```
Atm our land_plane method doesn’t  really do anything. Returns nil.  
Need to create a test.   
Create test that expect an error when airport is full.  
Rspec: 4 examples, 1 failure - “….not given a block”

Need to modify the land_plane method now and add some logic.
Add method initialise that creates @planes = [] empty array accessible to all methods.  
Add a fail message if the planes (array) is greater or equal than (fist case 1 )
If it’s not it will add the plane to the planes(array).

Rspec: 4 examples, 0 failures - 100% Coverage
Test with IRB too.  

---
_As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate_

Atm the first test is set to check a fixed capacity. We need to make it dynamic with a default.
Our method land_plane could take an argument that sets a default capacity and can overwritten. Using the default argument. 

IRB - we cannot land more than 1 plane atm.

Wrote 2 new tests.
I would like a default airport capacity
New tests expect to raise error when the default capacity (5 —> my fave number) is reached.  
Rspec: 5 examples, 1 failure. Coverage - 96.30% (new test fails)  
Added argument “capacity = 5” to the method land_plane. and modified appropriately the rest of the method (replaced 1 with capacity)  
Rspec: 5 examples, 1 failure. Coverage 100%.  
The new test passes but the previous test that tests capacity of 1 now fails. 
can be overridden as appropriate
Need to modify previous test and add the argument (1)  
Rspec: 5 examples, 0 failures. Coverage = 100%  
Test with IRB. And realised I have added the argument in the wrong place. Instead of adding to the land_plane method I had to add it to the initialise method.  
Modified rspec tests to reflect the change. 
IRB now works perfectly
And Rspec: 5 examples, 0 failures - 100%

---
_As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy_

IRB - Airport.new.plane_take_off -   
Atm this method only returns a message that the plane is no longer in the airport. We will fix that…
Also running this in IRB: Weather.new throws us a NameError.

We need a new weather class that throws us random weather and fix our method plane_take_off. But first let’s write tests.

In weather_spec.rb we expect a random weather
Created 2 tests that check the method “now” and they either receive sunny or stormy.  
Rspec: 5 examples, 2 failures   
Created method now in Weather.rb
And with ternary operator it gets a random number and sets if sunny or stormy.  
Tested in IRB and works.  
Rspec: at first tests were passing but coverage wasn’t 100% , 
After a few adjustments of the tests   
Rspec: 7 examples, 0 failures - Coverage 100%

Now need to create new test to prevent takeoff when the result of calling weather.now in the method is “stormy”.  
Created a test. Failed. Modified  take_off method. It now raise an error when Wether is stormy , else it removes one plane from the planes array.  
Tested in IRB and works well.  
But test still failing.  
Rspec: 8 examples, 1 failure - Coverage 97.96%  
Need to fix the new test.
Rspec: 8 examples, 0 failures - Coverage 100% 

---
_As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy_

IRB - airport.land_plane  
only land planes as long as it doesn’t reach capacity.

Need to write a test that doesn’t make land_plane method work if Weather.new.now is stormy.

User stories complete but lots to refactor and fix and add.
Rspec: 10 examples, 0 failed 
Changed methods to land and take_off.

---
### to be continued..
I added some checks but more is needed to be considered completed.
Lots of repeatition in tests.
And I know some methods are quite long. I have to work on that and adjust tests in rspec accordingly...