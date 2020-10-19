Airport Challenge
=================


I approached the problem by dividing up the building blocks provided by the user story. There are 2 users; the ATC who is the default user and the system designer. There are 3 classes; weather, planes and airport. The ATC wishes to instruct planes to land and take-off. However, landing is prohibited when the airport is at capacity or when the weather is stormy. This also prevents planes taking off.

To run, type: irb -r ./lib/airport.rb into the terminal

To play, start by calling a new airport object 'airport = Airport.new', then a new plane object 'plane1 = Plane.new'. You can optionally call a weather forecast at any time by typing 'weather = Weather.new' then 'weather.condition'. Stormy weather will prevent landing or taking off by giving an error message.

To start, place your plane in the hanger:

airport.land(plane1)

You can check it is in the hanger safely, by typing 'airport.hanger'.

To fly the plane: airport.take_off

When you land or fly your plane, it will show as either "on the ground" or "in the air" in the terminal.


Unfinished
----------
-----------
I was unable to get my weather forecast to send the status of the weather.condition, meaning I was unable to test for what happens during a storm. I was also having difficulty with my system designer method being interpreted as a constant rather than a method and being unusable for now.
