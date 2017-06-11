Airport Challenge
=================

![Alt text][id]

[id]: http://i.imgur.com/dsCKfFK.jpg  "Plane taking off"

Ruby program that replicates basic functionality of a software used to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny and the airport is not at capacity. Occasionally it may be stormy, in which case no planes can land or take off. It was developed based on the following user stories.

The program splits responsibility for achieving the needed functionality between 3 classes:
 - Plane (receives messages to land or takeoff )
 - Airport (allows planes to land or takeoff based on weather report and capacity)
 - Weather (randomly generates weather report with 80% chances of *sunny* and 20% of *stormy* )



************************************************************
As an air traffic controller  
So I can get passengers to a destination  
I want to instruct a plane to land at an airport and confirm that it has landed

Landing is achieved by instructing the plane to land which in turn calls the *land* function:

```ruby
airport = Airport.new(weather_provider, capacity)
plane = Plane.new
plane.instruct_to_land

airport.land(plane)
expect(airport.planes.last).to eq plane
expect(plane.airport_to_land).to eq airport
```


************************************************************
As an air traffic controller  
So I can get passengers on the way to their destination  
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

###### Taking off is achieved by sending a message to the plane that it can take off which in turn calls the *take_off* function


************************************************************
As an air traffic controller  
To ensure safety  
I want to prevent takeoff when weather is stormy  

###### A new instance of airport is created by specifying a *weather_provider* on which the *generator* method is called, resulting in 80% chances of "sunny" and 20% changes of "stormy".


```ruby
weather_provider = Weather.new
airport = Airport.new(weather_provider, capacity)

```
************************************************************
As an air traffic controller  
To ensure safety  
I want to prevent landing when weather is stormy  
************************************************************
As an air traffic controller  
To ensure safety  
I want to prevent landing when the airport is full  
************************************************************
As the system designer  
So that the software can be used for many different airports  
I would like a default airport capacity that can be overridden as appropriate  


###### Airport capacity is by default set to 5 but this can be overridden by providing another value when a new Airport instance is created.


************************************************************

#### How to install it

- Fork this repo, and clone to your local machine
- Run the command gem install bundle (if you don't have bundle already)
- When the installation completes, run bundle

#### How to test it
 - use rspec and rubocop

 #### Mentions

 I receieved pointers from a friend on how to mock weather forecasts in the Airport class.
