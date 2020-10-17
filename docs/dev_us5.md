# User Story Developmemt Path - Airport individual challenge
[README file](../README.md)
[Initial Review and Domain Model](initial_review.md)

[Previous User Story](dev_us4.md)  


## User Story 5/6
'''
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
'''

### Role: Controller
Objects: plane
Actions: prevent take_off if stormy at airport, prevent landing if stormy at destination

### Min Feature requirements:
confirm instruction to land is not completed if destination is stormy
confirm instruction to take_off is not completed if airport is stormy

### edge constraints:
implicit - any weather condition NOT stormy should allow the plane to carry out requested actions  

### Assumptions:
weather condition check for "stormy" is sufficient
the action should return an indicator that the action hasn't completed, rather than exit / crash software

### Considerations under review:
weather could be a "world" level entity, but this is only valuable with a timebase for travel
Geographical / geometric constructs for object locations would be required too.

### Feature Tests:
Controller (sole user) to access to an interface, to request a plane to land / take take_off
functionality:
  - requested actions should return a failure message (implicit requirement) to the user if stormy weather is present


### Unit Tests:
 - able to detect "stormy" weather at an airport at location of action (destination or current location of plane)
 - able to "fail" action if not safe

 UNIT Tests for interface - I am reviewing the 'user input' part of RSpec - managing interface testing through manual testing at the moment.
 - interface exists (user prompt and command capture)
   - prompt
   - issue action to planes
   - receive notification that action didn't complete due to safety (weather = stormy)

### "In Development" changes
