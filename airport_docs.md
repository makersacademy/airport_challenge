# Airport Documentation

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. Here are the user stories that we worked out in collaboration with the client:

##Airport User Stories

```
//land_at_airport
As an air traffic controller 
So I can get passengers to a destination
I want to instruct a plane to land at an airport

//take_off
As an air traffic controller 
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

//airport_full?
As an air traffic controller 
To ensure safety
I want to prevent landing when the airport is full

//default_capacity(capacity)
As the system designer 
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

//weather_stormy?
As an air traffic controller 
To ensure safety
I want to prevent takeoff when weather is stormy

//weather_stormy?
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```

| Object | Messages | Verbs | Purpose
| --- | --- | --- | --- |
| air_traffic_controller | land_at_airport | Instruct a plane to land at an airport | So I can get passengers to a destination
| | take_off | Instruct a plane to take off from an airport and confirm that it is no longer in the airport | So I can get passengers on the way to their destination
| | airport_full? | So I can get passengers on the way to their destination | To ensure safety
| | airport_capacity | | 
| weather | weather_stormy? | Prevent takeoff AND landing when weather is stormy | To ensure safety
| | random_weather | | 
| | weather_status | |
| system_designer | default_capacity(capacity) | Add a default airport capacity that can be overridden as appropriate | So that the software can be used for many different airports
| extras | random_weather | set the weather (it is normally sunny but on rare occasions it may be stormy) | 


