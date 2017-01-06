Airport Challenge
=================
week one challenge from makers academy
User Stories
-----

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
Domain model
-----
Objects  | Messages
------------- | -------------
Air Traffic Controller  |
passengers |
plane   | land (when not stormy or full airport)
        | takeoff
weather | is stormy or sunny
Airport | hold planes
        | has capacity which can be changed

**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes
