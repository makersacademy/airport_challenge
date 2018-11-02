# My approach for each user story

## User Story 1
> As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

This is identifying that there is the need for both a Plane and Airport class.
I created the classes, and identified that the Plane class needed a .take_off method that takes 1 argument which would be an instance of the Plane class. To ensure this, I created an Attr_reader for :planes to store planes that have landed


## User Story 2
> As an air traffic controller I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

For this user story, I created a .landing method to the Airport class, as well as a .in_the_sky? method to the Plane class. This resolves the user story, by taking off from the airport, and then doing a check on the plane to see if it is in the sky.

I am aware that a plane is being created out of thin-air here. I am expecting to resolve storage/tracking of landing/take off of planes in future user-stories. I am purely focusing on the TDD/ODD development of the challenge at present.
