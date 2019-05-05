[![Build Status](https://travis-ci.org/micosmin/airport_challenge.svg?branch=master)](https://travis-ci.org/micosmin/airport_challenge)

# Airport challenge

## Client requirements

User stories:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

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

Domain Model

| Subject            | Behaviour        |
| ------------------ | ---------------- |
| Traffic Controller |                  |
| Airport            | land             |
|                    | take_off         |
| Plane              | land_at(airport) |
|                    | takeoff          |
| Weather            | random_weather   |

## Airport class

### attributes

- default capacity when class is initialized

### #land

- land(plane)
- checks if whether is stormy
- checks if airport is full
- adds plane to airport

#### Edge cases

- plane already landed can't land again
- planes already landed must be in an airport

### #take_off

- take_off(plane)
- remove from airport
- confirm plane has taken off
- prevent take_off if weather stormy

#### Edge cases

- plane can take off from the airport it is in
- plane already flying cannot take off or being in an airport

## Plane class

- initialize plane object
- plane gets assigned an airport when it lands

  - assigns the airport it is in to prevent response to a land message while in airport

- landing changes plane's status: flying/landed
- plane removes airport value from its attributes when it takes off
- plane changes state to :flying after it takes off
- plane changes state to :landed after it lands

  - to prevent message ot taking off is flying or landing if it is not flying
  - check that the airport gives command to planes in its hangar only

## Weather class

- weather object created with random status whenever a plane attempts to land or take off

## To run locally

`git clone https://github.com/micosmin/airport_challenge.git`

`bundle install`

`rspec`
