# User stories

----------------------------------------------------

## User story 1:

As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

Nouns:
- plane
- airport

Verbs:
- land

| Objects  | Messages        |
| -------- | --------------- |
| Air traffic controller | |
| Plane | |
| Airport | land |

Airport <-- land

----------------------------------------------------

## User story 2:

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

Nouns:
- plane
- airport

Verbs:
- take_off

| Objects  | Messages        |
| -------- | --------------- |
| Air traffic controller | |
| Plane | |
| Airport | take_off |

Plane <-- take_off

----------------------------------------------------

## User story 3:

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full

Nouns:
- airport

Verbs:
- prevent landing

| Objects  | Messages        |
| -------- | --------------- |
| Air traffic controller | |
| Airport | prevent landing |

Raise an error for take_off when there are no planes in the airport.
Raise an error for land when there is already a plane in the airport.

----------------------------------------------------

## User story 4:

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

Remaining feature - allow system designer to overide default value for capacity

----------------------------------------------------