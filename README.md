Airport Challenge
=================
### Summary of the Challenge
=================
### Story 1
As an air traffic controller\
So I can get passengers to a destination\
I want to instruct a plane to land at an airport

| Object | Message |
| --- | ----------- |
| Air traffic controller  |  |
| Plane                   | land |
| Airport                 |      |

Plane --land--> Airport

####Feature test:\
plane = Plane.new\
airport = Airport.new\
airport.planes #shows that airport is empty\
=> []\
plane.land(airport) #plane instructed to land\
airport.planes #shows that plane has landed\
=> [plane_object]

=================
### Story 2
As an air traffic controller\
So I can get passengers on the way to their destination\
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

| Object | Message |
| --- | ----------- |
| Air traffic controller  |  |
| Plane                   | take_off |
| Airport                 |      |

Plane --take_off--> Airport

####Feature test:\
plane = Plane.new\
airport = Airport.new\
plane.land #plane instructed to land\
airport.planes #shows that plane has landed\
=> [plane_object]\
plane.take_off\
=> Confirmation that plane is no longer at airport\
airport.planes #confirms that plane is no longer at airport\
=> []

=================
### Story 3
As an air traffic controller\
To ensure safety\
I want to prevent landing when the airport is full

| Object | Message |
| --- | ----------- |
| Air traffic controller  | |
| Plane                   | land |
| Airport                 |   full?   |

Plane <--land--> Airport <--full?--> true/false

####Feature test:\
airport = Airport.new(10) #set a capacity of 10\
10.times do\
  plane = Plane.new\
  plane.land\
end \
plane = Plane.new\
plane.land\
=> Error message

=================
### Story 4
As the system designer\
So that the software can be used for many different airports\
I would like a default airport capacity that can be overridden as appropriate

####Feature test:\
airport = Airport.new
airport.capacity
=> 20 # assume a default capacity of 20
airport.capacity = 40
airport.capacity
=> 40 # capacity overridden

=================
### Story 5
As an air traffic controller \
To ensure safety\
I want to prevent takeoff when weather is stormy\

####Feature test: when stormy\
airport = Airport.new
plane = Plane.new
plane.land
=> error

####Feature test: when stormy and already landed plane\
plane.take_off
=> error
