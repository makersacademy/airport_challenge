User story 1:

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

Airport <-- land --> returns a plane object

----------------------------------------------------

User story 2:

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

Plane <-- take_off --> creates a plane object

----------------------------------------------------

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

----------------------------------------------------
