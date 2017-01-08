Airport Challenge
=================
first weekend challenge from maker's academy!

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
Air Traffic Controller  | orders planes about
passengers |
plane   | land (when not stormy or full airport)
        | takeoff
weather | is stormy or sunny
Airport | hold planes
        | has capacity which can be changed

for my solution i'm using four classes, the decision i'm least sure on is giving each airport it's own weather system/station as this seems to break "single resposibility". However I feel it better matches what you might find in the real world. A solution might be to make Airport a class that contains AirportHanger and AirportWeather and have the Airport class just be a place to pass messages through to the appropriate parts.

usage
-----
pass `land_plane` or `take_off_plane` to a `AirTrafficControl` instance with the arguments `Plane, Airport`
