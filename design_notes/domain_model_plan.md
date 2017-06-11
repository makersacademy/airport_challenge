

## Domain Model ##

The general aim of this doc is to create a domain-model for my airport script.
I want this model so that I can then create another diagram - one that shows the
responsibilities and relationships of the objects that make up my airport programme.

## Use Stories ##

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


## Identifying Classes and Behaviour ##

__Candidate classes__

__Nouns:__

Plane. Controller. Airport. Weather.

__Candidate behaviours__

__Verbs:__

Fly. Land. Stormy? Full? Check_weather. Check_capacity. Check_in_flight. In_flight?

Certain behaviours here suggest others will be required:

Dock (because where does a landed plane go?). De-dock. Weather_generator (because
weather conditions need to vary).


## Functional Representation ##

| Object       | Behaviour        |
| :-------------: |:-------------:|
| Plane     | in_flight? |
| Plane     | fly    |
| Plane | land      |
| Weather | generate_weather |
| Weather | stormy? |
| Airport | dock |
| Airport | dedock |
| Airport  | full? |
| Airport | check_capacity |
| Airport | check_weather |
| Airport | check_in_flight |
| Airport | check_hanger
