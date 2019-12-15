# Airport Challenge
---------

```
        ______
   -  -- \    \
          \ CW \
    -  --  \____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
   -  -- `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

## Client Requirements
---------

We have a request from a client to write the software to control the flow of planes at an airport:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```
```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
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

## Approach
---------

Extract scope:
* Simple program to organise the landing and taking off of planes from a air traffic controllers point of view
* Single random variable of weather in determining ability to land
* No scope defined for number of airports, so will assume three airports (London, Luton, Gatwick)
* No scope defined for number of planes or airlines, so will assume generic plane with unlimited avaliablity for initalization
* Assumes planes will be initialized by default in flight, however gives option to initialize in airport
* No scope for flightpaths or times, so will assume once a plane has departed it can immediately land again
* Assume any plane which is landed is immediately available for departure


List out required objects from client requirements:
* AirTrafficController
* Airport
* Plane
* Weather


List out required controller messages:
* AirTrafficController -> Plane (Land at airport)
  - providing plane is in the air
  - if weather is not stormy
  - if airport not full
* AirTrafficController -> Plane (Take off from airport)
  - if plane is in the airport
  - if weather is not stormy


List out required attributes of each non-controller object:
* AirTrafficController
* Airport
  - Array to store planes with set capacity
  - Airport IATA code
* Plane
  - Flight status
* Weather
  - Weather status at specific airport


Create diagram for major processes:
* air_traffic_controller.land_plane(airport, plane) add link to image
* air_traffic_controller.depart_plane(airport, plane) add link to image


List out required messages between objects from diagram:
* good_weather?(airport): air_traffic_controller --> weather
* iata_code: weather --> airport
* airport_at_capacity?: air_traffic_controller --> airport
* cleared_to_land(airport): air_traffic_controller --> plane
* land_plane(plane): plane --> airport
* plane_departure_ready?(plane): air_traffic_controller --> airport
* cleared_for_takeoff(airport): air_traffic_controller --> plane
* plane_departed: plane --> airport


Create RSpec for basic object functions and implement TDD:
* weather.good_weather?(airport)
* airport.iata_code
* airport.airport_at_capacity?
* plane.cleared_to_land(airport)
* airport.land_plane(plane)
* airport.plane_departure_ready?(plane)
* plane.cleared_for_takeoff(airport)
* airport.plane_departed(plane)

Create RSpec for controller (AirTrafficController) and implement TDD:
* air_traffic_controller.land_plane(airport, plane)
  - planes do not land if bad weather
  - planes do not land if airport is at capacity
  - planes land if no bad weather and airport has capacity
  - 
