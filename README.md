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
