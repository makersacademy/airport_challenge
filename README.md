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

Instructions
---------
We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.
* More detailed instructions [here](INSTRUSTIONS.md)

Domain Model
-------
```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```

Objects  | Messages
------------- | -------------
Air traffic controller  |
Plane  | land

```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
Objects  | Messages
------------- | -------------
Air traffic controller  |
Plane  | takeoff
airport | empty
```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```
Objects  | Messages
------------- | -------------
Air traffic controller  |
Plane  | takeoff(stormy?)
airport | can't takeoff

```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
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
