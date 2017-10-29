
```
        ______
        _\____\___
=  = ==(____IP____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

# Airport Challenge

The Airport Challenge is the first weekend challenge at Makers Academy. The request is to write a software to control
the flow of planes at an airport.

This is my proposed solution using Ruby.

I created two classes, Airport and Plane, that can be found in the lib directory as airport.rb and plane.rb. The
tests for each one can be found in the spec directory and can be run using RSpec.

Every Plane created has a status that shows if it is "in flight" or "landed" at an airport. The default for a new plane
is "in flight", you can think of it as leaving the factory where it was created and now being available to land at any airport when required.

Every Airport created has a default capacity of one plane that can be overridden as desired, a database of the planes that
are at the airport, and a description of the weather conditions in the area. It is usually "sunny" around the airports but there is a chance of one in ten that it is "stormy" and when this happens all landing and take off operations are cancelled.

Every time a plane lands or takes off both its status and the airport database are updated. Edge cases have been considered so that planes can only take off from airports they are in, planes that are already flying cannot take off and/or be in an airport and planes that are landed cannot land again and must be in an airport, etc.
