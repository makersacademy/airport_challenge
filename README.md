Airport weekend challenge, written by Reiss Johnson. 23/01/2016

This program follows a given user story which can be seen below.

In order to test the functionality of this program it can be run in IRB.

... This program's user story is as follows...


----------------------------------------------------------------------------------------------------------
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed

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

-----------------------------------------------------------------------------------------------------------

The program is written in ruby and can be tested in IRB.

Function tests were performed in IRB with each unit test written in a spec file & ran through RSPEC.

You can run program in IRB like this...


    2.2.3 :004 > require './lib/Airport.rb'
     => true

    2.2.3 :005 > manchester = Airport.new
     => #<Airport:0x007fe9a300f818 @planes_on_the_ground=[], @planes_in_the_air=[], @current_weather=#<Weather:0x007fe9a300f7a0>, @capacity=10>

    2.2.3 :006 > plane1 = Plane.new
     => #<Plane:0x007fe9a3004d00>

    2.2.3 :008 > manchester.land plane1
     => [#<Plane:0x007fe9a3004d00>]

    2.2.3 :009 > manchester.takeoff plane1
     => [#<Plane:0x007fe9a3004d00>]

    2.2.3 :010 > manchester.capacity
     => 10


25-01-16

RSpec is passing, the program covers all of the features asked however it still needs refactoring to make it a bit tidier.

Spec files are found in the ./spec folder with library files found in ./lib.



