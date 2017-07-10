
User Stories --> Domain Models
======================================

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed

Objects  | Messages
------------- | -------------
Air traffic controller  |
Airport | landed?
Plane | land

Airport <----landed?----> true/false
Plane ----> land

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

Objects  | Messages
------------- | -------------
Air traffic controller  |
Plane  | takeoff?
Plane | not_at_airport?

Airport <----Plane--->take-off
Plane <---- takeoff? ----> true/false

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

Objects  | Messages
------------- | -------------
Air traffic controller  |
Weather | stormy?
Plane | take-off?

Weather <---- stormy? ----> true/false
Plane <---- take-off? ----> true/false

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

Objects  | Messages
------------- | -------------
Air traffic controller  |
Weather  | stormy?
Plane | landed?

Weather <---- stormy? ----> true/false
Plane <---- landed? ----> true/false

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

Objects  | Messages
------------- | -------------
Air traffic controller  |
Plane  | landed?
Airport | full?

Plane <---- landed? ----> true/false
Airport <---- full? ----> true/false

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

Objects  | Messages
------------- | -------------
System designer  |
Airport | capacity?

Airport <---- capacity? ----> DEFAULT_CAPACITY

```
