# User Story Developmemt Path - Airport individual challenge
[README file](../README.md)
[Initial Review and Domain Model](initial_review.md)

[Previous User Story](dev_us2.md)  |  [Next User story](dev_us4.md)


## User Story 3
'''
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
'''

### Role: Controller
Objects: plane, airport(destination)
Actions: land plane @ destination, confirm airport not full

### Min Feature requirements:
confirm destination airport not full prior to land action
ability to set default capacity of airport

### edge constraints:
explicit - only land if airport is not full
possible implied - specific plane [valid plane]

### Assumptions:
destination airport is valid (set at point of take_off
assumptions (minimum state) - airports have a default capacity

### Considerations under review:
An air traffic controller MAY be specific to a location (airport) [currently ruled out in assumptions]
There may need to be a "world" construct required as part of US4 to provide airports (destinations) and a fleet of planes
US4 is requiring airport capacity to be varied - using default for now
weather is implied to be 'random' with a bias away from stormy - weather system could be part of 'world' construct - but min is local check at time of action

### Feature Tests:
Controller (sole user) to input to an interface, to instruct A PLANE to land at a DESTINATION, checking if the DESTINATION is full or not
functionality:
  - list airports available (assume only two available at the moment)
    - not explicit requirement, but making available now to provide interface flow
  - instruct a plane to land (destination set)
  - determine the capacity status of DESTINATION
    - prevent landing (raise error) if full - inform user

### Unit Tests:
 - able to list airport objects
 - can instruct plane to land
  - set location to 'DESTINATION' if successful landing
  - raise an error when asked to land and DESTINATION is full

 UNIT Tests for interface - I am reviewing the 'user input' part of RSpec - managing interface testing through manual testing at the moment.
 - interface exists (user prompt and command capture)
   - prompt
   - list airports
   - validate capacity of airport

### "In Development" changes
