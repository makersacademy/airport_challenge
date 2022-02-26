# Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

##User Stories

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```

* Feature test: IRB 'airport = Airport.new'

* uninitialized constant Aiport (NameError)

* created airport_spec.rb and airport.rb

* wrote start of first unit test - describe Airport do end - 
NameError:
  uninitialized constant Airport

* Committed and pushed 'Created airport lib and spec files'

* created Airport class and required lib file in spec - rspec now passes as expected with 0 examples, 0 failures

* was now able to create a new Airport object in IRB, but airport.land(plane) throws up "undefined local variable or method `plane'" for that object

* fleshed out unit test, expect Airport to respond to land with 1 argument - rspec error

* defined land method with (plane) parameter to Airport class - this now passes (1 example, 0 failures)

* back to IRB, plane throwing uninitialized constant error so create plane class - now IRB up to airport.land(plane) returns nil but passes
 
```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

* start with airport.take_off(plane) in IRB - undefined method error - unit test - also error so define method as before - passes (2,0)

* need to see plane no longer at airport - IRB up to airport.take_off(plane) returns nil - then airport.plane - undefined method 'plane'

* unit test expected to respond to plane (dealing with just the one for now) - fail

* define plane method in Airport, now pass (3,0) in Rspec but returns nil in IRB, as does airport.land(plane) and take_off too

* unit test describe '#land' method, making a new plane instance in it and expecting landing it to equal plane - this fails Rspec it returns nil instead of new plane created, so just add 'plane' to land method - this now passes but in IRB airport.plane still returns nil

* focus back on take_off as per US - got distracted! - unit test describing take_off method expecting it to eq 'The plane has left the airport' string - fails, gets nil, so add that string to the method - passes (5,0) RSpec and works in IRB too

* occurred I might want to change the take off message so make it a constant in class and test - this passes

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
```
* right now in IRB I can do airport.land(Plane.new) an unlimited number of times so I make a unit test for land method landing one plane then expecting to raise error when another is landed

* this RSpec fails so add fail guard to land method - still failing so I need to initialize with array and (capacity) and update my methods to act in accordance with array - still failing so I update my unit test for the land error raise to reflect new capacity, and I comment out old tests which are now throwing errors (presumably due to method changes) - it now passes RSpec and I get the Airport full RuntimeError in IRB as desired

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

* unit test describing initialization expecting it to raise_error when 31 planes are landed and capacity is 30 - this doesn't work - I make capacity attr_accessor and update unit test with Airport::DEFAULT_CAPACITY instead of 30 and it passes

* I now realise I've got so into it I've forgotten to commit - so I commit!

* Took out empty plane method and made attr_reader :planes, updated relevant test  - old take-off test I'd commented out I managed to get passing again by creating a new Airport instance in it rather than just using subject

```
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 
```

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)