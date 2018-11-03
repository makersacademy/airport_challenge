# My approach for each user story

## User Story 1
> As an air traffic controller
> So I can get passengers to a destination
> I want to instruct a plane to land at an airport

This is identifying that there is the need for both a Plane and Airport class.
I created the classes, and identified that the Plane class needed a .take_off method that takes 1 argument which would be an instance of the Plane class. To ensure this, I created an Attr_reader for :planes to store planes that have landed


## User Story 2
> As an air traffic controller
> So I can get passengers on the way to their destination
> I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport


For this user story, I created a .landing method to the Airport class, as well as a .in_the_sky? method to the Plane class. This resolves the user story, by taking off from the airport, and then doing a check on the plane to see if it is in the sky.

I am aware that a plane is being created out of thin-air here. I am expecting to resolve storage/tracking of landing/take off of planes in future user-stories. I am purely focusing on the TDD/ODD development of the challenge at present.

## User Story 3
> As an air traffic controller
> To ensure safety
> I want to prevent takeoff when weather is stormy

Here, I spent a bit of time figuring out whether checking the Weather should be a separate Class. Eventually I decided it should be. Reflecting on this, it seems obvious, but my thought process initially was that the weather is specific to the airport, so it should sit within the Airport. However, as Weather is very much 'separated' from what would be expected within an Airport, I decided to go with a dedicated Weather Class.

I had a lot of struggle figuring out the syntax for the tests, so I had to do quite a bit of back-and-forth with test Ruby code and RSpec code to figure out how to get my tests to check what I want them to be checking. I have completed this test in the simplest way for me I found - as this will be coming up again in the following user story, I decided to accept what I did initially, and then force the refactoring after the completion of the following.

## User Story 4

> As an air traffic controller
> To ensure safety
> I want to prevent landing when weather is stormy

Due to the similarity of this User Story with User Story 3, I used the same technique but assigned it to the Landing method as opposed to the take_off method

## User Story 5

> As an air traffic controller
> To ensure safety
> I want to prevent landing when the airport is full

I came to this User Story last - this was because i felt that there was need to do a few additional steps (I was also really enjoying this challenge and put more effort into personal quality of life changes such as plane names etc.)

To complete this challenge, I gave names to planes (3 A-Z + 2 1-9). Further, I set up facility to store the plane names in the airport of any plane that landed. This allowed me to count the number of planes in the airport, ensuring that there wasn't 'duplication' - i.e., you cannot land twice



## User Story 6

>As the system designer
> So that the software can be used for many different airports
> I would like a default airport capacity that can be overridden as appropriate

This was a very simple implementation - I added a new argument to the Class for when it is created, and set the default to be 20, with scope to be overwridden
