# Airport Challenge (Makers Academy Weekend Challenge #1)

A basic simulation of airport ground control.

## Contents
/lib  
airport.rb  
plane.rb  
weather.rb  

/spec  
airport_spec.rb  
plane_spec.rb  
weather_spec.rb  

## Getting Started

1) Clone or download and unzip repository.
2) Load 'airport.rb' in irb, pry or other ruby REPL. All dependencies loaded automatically.

## Instructions for use

The ground control simulation has three elements - airports, planes and weather.

To make a new airport, input **[airport] = Airport.new**, where [] indicates the user should input a variable name of their choice.

To make a new plane, input **[plane] = Plane.new**

To make new weather, input **[weather] = Weather.new**

The following SOP will use airport, plane and weather as placeholder names to refer to any instance of the Airport, Plane or Weather class.

Planes are assembled by Zeus and flung into the world mid-flight. To land a newly created plane, use **airport.land(plane, weather)**. If **the weather conditions are suitable** and the **airport isn't full**, the plane will land and be parked.

To check weather conditions, use **weather.report** (NB weather is pretty tricky stuff and will change from clear to stormy instantly, so there isn't much point in checking it. Good luck with the landing anyway!). As weather is so changeable, landings that cannot be completed due to stormy weather should be successful with subsequent attempts.

Airport capacity defaults to 5 planes, and can be checked with **airport.plane_capacity**. You can land planes as long as the airport isn't full. You shouldn't land planes at a full airport because it's dangerous. However, if you desperately **have** to bend the rules and land a plane at a full airport (or stop a plane landing at an empty airport) for reasons relating to romance/terrorism/saving christmas etc you can use **airport.override_capacity([new capacity])** to expand ( or reduce ) the number of planes an airport can take.  

To tell a parked plane to take off, use **airport.takeoff(plane, weather)**. If the weather is calm, the plane will take off. As with landings, unsuccessful takesoffs due to stormy weather should be successful if you simple try again. If you want to ensure the plane you have just told to take off has gone, **airport.confirm_departure(plane)** will return **true** if that particular plane is no longer parked at the airport.

## Testing

All tests were designed and run using the rspec framework. If the rspec gem is installed, they can be run from terminal in the main repository folder using the **rspec** command.

## Development: Domain Modelling

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```
| object | message |
|--|--|
|airport| land(plane)|
|plane| lands |
|airport| adds plane to inventory|

DONE

```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

| object | message |
|--|--|
|airport| takeoff(plane)|
|plane| takes off |
|airport| removes plane from inventory|

DONE

```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```
DONE

| object | message |
|--|--|
|airport| check_weather(weather) |
| weather | stormy? |
|airport| takeoff(plane) unless stormy |

```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```
| object | message |
|--|--|
|airport| check_weather(weather) |
| weather | stormy? |
|airport| land(plane) unless stormy |

DONE

```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```

| object | message |
|--|--|
|airport| land(plane) unless full? |

DONE

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
| object | message |
|--|--|
| airport | variable capacity|

DONE
