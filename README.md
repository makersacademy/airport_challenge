Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

creating a software to control the flow off planes at an airport. 

planes can land and take off but only if it is sunny, ocassionally it can be stormy - during which no planes can land or take off.



6 user stories:

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


OBJECTS - MESSAGES

nouns: air traffic controller, airport, planes, system designer, software, default airport capacity, weather

verbs: plane lands, plane takes off, if stormy/sunny, if capacity reached

weather - if sunny/storm? (can land/can't land)
default capacity - if reached? (plane can't land)
