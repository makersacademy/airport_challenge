![](https://placehold.it/950x200/374c53/FFFFFF/?text=Airport+Challenge)

``````
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

``````

To succeeded in this challenges I will try to follow the same structure of the boris_bikes challenge

## Users Stories

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```

## Objects and Messages

| Object            | Message     |
| ----------------- | ----------- |
| Trafic controller |             |
| Airport           | full?       |
| Plane             | at_airport? |
| Weather           | sunny?      |

## Diagram

<img src="https://github.com/xavierloos/airport_challenge/blob/master/airport-diagram.png">

## Solution

For the solution of this challenge I created 3 ruby files int the lib folder:
In ./lib/airport.rb

```
The main class contains Airport with the methods initialize, takeoff and land
```

In ./lib/plane.rb

```
We create the planes and check the state of the plane
```

In ./lib/weather.rb

```
We have the weather conditions which will change randomly the state of the weather
```

For the RSpec test I created 3 files:
In ./lib/airport_spec.rb

```
We have the main files test that will check all the methods of the airport class.
```

In ./lib/plane_spec.rb

```
This test will responde if the plane is flying
```

In ./lib/weather_spec.rb

```
The test will check if the weather conditions are ok to fly
```
