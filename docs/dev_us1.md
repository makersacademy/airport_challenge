# User Story Developmemt Path - Airport individual challenge
[README file](../README.md)
[Initial Review and Domain Model](initial_review.md)

[Next User story 2](dev_us2.md)


## User Story 1
'''
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
'''

### Role: Controller
Objects: plane(passengers), airport(destination)
Actions: land plane @ airport

### Min Feature requirements:
'land' a plane at an airport
[consideration] multiple airports (User Story [US] 4)

### edge constraints:
explicit - only land if airport isn't full (US3)
possible implied - specific plane [valid plane]
explicit - specific airport to achieve 'destination' [valid airport] (US1)
possible implied - role logon / environment
explicit - only land if weather is not stormy (US6)

### Assumptions:
passengers are in plane, destination is equal to particular airport
role logon not required until multiple software users (and isolation) is identified
single user environment, but interface for valid actions required

### Considerations under review:
An air traffic controller MAY be specific to a location (airport)
There may need to be a "world" construct required soon to provide airports (destinations) and a fleet of planes
weather is implied to be 'random' with a bias away from stormy - weather system could be part of 'world' construct - but min is local check at time of action

### Feature Tests:
Controller (sole user) to input an interface to instruct A PLANE to land at AN AIRPORT
functionality:
 - list planes (assume only one available at the moment)
  - not explicit requirement, but making available now to provide interface flow
 - instruct a plane to land (assume plane already knows destination)

### Unit Tests:
 - objects exists (object classes available)
  - plane
  - airport
 - able to list plane objects
 - plane has 'destination'
 - able to land plane (need to determine action focus location)
 - interface exists (user prompt and command capture)
   - prompt
   - list
   - land
