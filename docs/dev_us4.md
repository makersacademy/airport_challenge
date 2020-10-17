# User Story Developmemt Path - Airport individual challenge
[README file](../README.md)
[Initial Review and Domain Model](initial_review.md)

[Previous User Story](dev_us3.md)  |  [Next User story](dev_us5.md)


## User Story 4
'''
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
'''

### Role: Controller
Objects: airport(multiple)
Actions: have a "default capacity", allow the capacity variable to be overridden

### Min Feature requirements:
confirm new airport has a default capacity
confirm the default capacity can be overridden
confirm the ability to have multiple airport objects available for Controller review

### edge constraints:
implicit - capacity should not equal zero
implied through object content - capacity should be an integer
implicit - capacity should not be empty (no logical expected response)
implicit - number of airports can not be zero (no logical action for planes)

### Assumptions:
zero / empty / nil / false states aren't being used as an implicit block (say for an airport under construction/ maintenance)
The requirement is for an integer (not using some overlay for 'small' aircraft considered to be say 0.5 'normal' aircrafts)

### Considerations under review:
An air traffic controller MAY be specific to a location (airport) [currently ruled out in assumptions]
[Firm] using the requirement of "multiple airports" to drive creation of a "world" container
  this would also facilitate some system scenario testing, and may even allow "multiple worlds" (e.g. allow different controller contexts)

### Feature Tests:
Controller (sole user) to access to an interface, to review a specific AIRPORT to determine capacity and override if required
functionality:
  - list airports available (multiple)
    - not explicit requirement, but making available now to provide interface flow
  - display the 'capacity' of the airport
  - allow the capacity to be changed

### Unit Tests:
 - able to list airport objects
 - display capacity of an airport
 - able to change the capacity of an airport

 UNIT Tests for interface - I am reviewing the 'user input' part of RSpec - managing interface testing through manual testing at the moment.
 - interface exists (user prompt and command capture)
   - prompt
   - list airports
   - validate capacity of airport

### "In Development" changes
Creation of a "world" container ... this will make scenario testing and potential future functionality, without requiring excessive immediate development structures or contexts.
created default scenario - and ability to change object numbers (prior to setup) - using default names

decision to display airport and capacity in the interface (on request) to enable better Controller review and selection - design decision
