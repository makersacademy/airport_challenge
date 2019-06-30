# Week 1 Weekend Task
## Airport Challenge

### NOTE TO CODE REVIEWER
I realised at a late stage that it would have perhaps been better to have the ```Plane``` class have methods of ```.take_off``` and ```.land rather``` than the ```Airport``` class having methods of ```.plane_take_off``` and ```.land_plane```.
When I read the user stories and drafted my Domain Model, I was comparing it to the Boris Bikes challenge and, therefore, modelled it very much the same way. In hindsight, I should have had a more open mind when reading the user stories. Lesson learned.

Notwithstanding the above, as hopefully I have explained below and is shown in the code, I managed to fulfil the challenge requirements using TDD.

## HOW I APPROACHED THE CHALLENGE
I used TDD to build the appropriate classes, modules and methods as required by the user stories submitted by the client. See [the original README file](https://github.com/makersacademy/airport_challenge) for details the challenge.

I used a methodical approach to TDD using a following procedure:

1. Feature test - which will fail. The error message was used to ascertain what the unit test should be testing.
2. Unit test - which will fail. The error message gives insight as what code needs to be written to pass the test.
3. Write the simplest code to make the test pass
4. Refactor the code
5. Repeat the above until the requirements of the user stories have been fulfilled.
