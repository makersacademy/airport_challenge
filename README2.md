Planning and To Do


First user story:

As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport


Airport => .land => register the landing


To do

- Create an Airport class
- create .land method
- create an array where you can register the plane
- add the landing plane for the register
- create a .show_register method to show the register

Second user story

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

Airport => .take_off => remove the plane from the register => message the plane take off

To do

- create .take_off method
- remove the plane from the register
- add a message when the plane take off