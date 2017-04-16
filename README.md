
## Task overview

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.


## User stories

The following user stories were worked out in collaboration with the client and were used when deciding what approach to take.

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed
```
airport = Airpot.new <br />
plane = Airplane.new <br />
airport.land(plane)  <br />
plane.landed?  <br />

```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
Assumes a plane has already landed: <br />
airport.take_off(plane) <br />
plane.taken_off? <br />

```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```

def stormy? <br />
   rand(7) > 6 <br />
end <br />

This gives the likelihood of it being stormy only one day a week.
if stormy? = true, airport.take_off(plane) would produce the error message 'Weather too stormy right now'

```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
For these two I used a new method called full? and set it to contain a boolean, calling false when the number of plains landing was over the capacity.
<br />
<br />
The capacity was set to have a default of 100, that could be changed depending on the user.
```
e.g
2.2.3 :001 > require './lib/airport'
 => true
2.2.3 :002 > gatwick = Airport.new
 => #<Airport:0x007fda14848c80 @planes=[], @capacity=100>
2.2.3 :003 > heathrow = Airport.new(50)

 => #<Airport:0x007fda14833b28 @planes=[], @capacity=50>
 ```
