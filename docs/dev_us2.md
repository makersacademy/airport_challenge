# User Story Developmemt Path - Airport individual challenge
[README file](../README.md)
[Initial Review and Domain Model](initial_review.md)

[Previous User Story](dev_us1.md)  |  [Next User story](dev_us3.md)


## User Story 2
'''
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
'''

### Role: Controller
Objects: plane(passengers), airport(destination)
Actions: take_off plane @ airport, confirm plane not @ airport

### Min Feature requirements:
'take_off' a plane at an airport
confirm plane not @ airport
[consideration] multiple airports (User Story [US] 4)
[consideration] plane status management
[consideration] plane identification - opportunity for introductio of 'name'/ 'registration'?

### edge constraints:
inplicit - only take_off if plane is at airport (impacts scope of Controller?)
possible implied - specific plane [valid plane]
implicit - specific airport to achieve 'destination' [valid airport] (US1/2)
explicit - only take_off if weather is not stormy (US6)

### Assumptions:
passengers are in plane, destination is equal to particular airport
role logon not required until multiple software users (and isolation) is identified - assuming airport software installations are to enable a single air traffic controller role to manage planes at all locations.
single user environment, but interface for valid actions required

### Considerations under review:
An air traffic controller MAY be specific to a location (airport) [currently ruled out in assumptions]
There may need to be a "world" construct required as part of US4 to provide airports (destinations) and a fleet of planes
weather is implied to be 'random' with a bias away from stormy - weather system could be part of 'world' construct - but min is local check at time of action
no mention of checking destination airport for space - assume that this is not a consideration / requirement - [part of the decision at point of action assumption]

### Feature Tests:
Controller (sole user) to input an interface to instruct A PLANE to take_off from AN AIRPORT to a DESTINATION
functionality:
  - list planes available at airport (assume only one available at the moment)
    - not explicit requirement, but making available now to provide interface flow
  - set a 'destination' for a plane
  - instruct a plane to take_off (destination set)

### Unit Tests:
 - objects exists (object classes available)
  - plane
  - airport (source and destination)
 - able to list plane objects at source airport
 - can set plane 'destination'
 - able to take_off plane (need to determine action focus location)

 UNIT Tests for interface - I am reviewing the 'user input' part of RSpec - managing interface testing through manual testing at the moment.
 - interface exists (user prompt and command capture)
   - prompt
   - list planes
   - list airports
   - take_off

### "In Development" changes
  - changed the @status variable for plane to @location
    - "on_ground" changed to airport object - to enable easier airport capacity management
    - maintaining "in_air" as is - destination MAY change
  - added name to airport so that airports can be identified
