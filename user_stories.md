
````
airport = Airport.new
````

As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
# (instruct, plane, land, airport)

````
airport.land(plane)
````

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
# (instruct, plane, take_off, airport, confirm)

````
airport.take_off(plane)
# confirmation that plane is not in airport anymore
````

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
# (prevent landing, airport) : capacity constraint

````
airport.land(plane) #> throws error if airport full
````

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
# set default capacity (as a constant)

````
Airport::DEFAULT_CAPACITY
````

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
# (prevent takeoff) : weather constraint

````
````

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
# (prevent landing) : weather constraint


## Edge Cases
- planes can only take off from airports they are in
- planes that are already flying cannot take off
- planes that are already flying cannot be in an airports
- planes that are landed cannot land again
- planes that are landed must be in an airport


## Things to change / update
- Sort out all the rubocop offenses
- Make specific planes take off (rather than just the last in the array)
- Create README.md (use this file as a reference)
- Update spec file to incorporate 'context' to group tests into blocks. Also make good use of before too (understand better how to use 'let' and 'subject')
- Work out how to write test better: plane can't land when aiport is at capacity (would rather it didn't use .land in test setup)
