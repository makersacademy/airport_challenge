# Week 1 Weekend Task
## Airport Challenge

### IMPORTANT NOTE TO FILE REVIEWER
I realised at a late stage that it would have been better to have the Plane class have methods of .take_off and .land rather than the Airport class having methods of .plane_take_off and .land_plane.
When I read the user stories I was comparing it to the Boris Bikes challenge and therefore modelled it in much the same way. In hindsight, this was wrong and I should have had a more open mind when ready the user stories. Lesson learned.

However, as I will explain below and is hopefully shown in the code, I completed the challenge requirements using TDD, rubocop, insuring

## EXPLANATION OF HOW I COMPLETED THE CHALLENGE
To complete the challenge I fulfilled the client's request (as set out in the user stories) for software to control the flow of planes to and from an airport. I used TDD to build the appropriate classes, modules and methods.

I used a methodical approach to TDD using a following procedure:

1. Feature test - which will fail. Used to ascertain what the unit test should test for.
2. Unit test - which will fail. This gives insight as what code needs to be written to pass the test.
3. Write the simplest code to make the test pass
4. Repeat with another feature of the program

### More detail on how each user story was fulfilled:

    As an air traffic controller
    So I can get passengers to a destination
    I want to instruct a plane to land at an airport

    As an air traffic controller
    So I can get passengers on the way to their destination
    I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

    As an air traffic controller
    To ensure safety
    I want to prevent takeoff when weather is stormy

    As an air traffic controller
    To ensure safety
    I want to prevent landing when weather is stormy

    As an air traffic controller
    To ensure safety
    I want to prevent landing when the airport is full

    As the system designer
    So that the software can be used for many different airports
    I would like a default airport capacity that can be overridden as appropriate

    Your code should defend against edge cases such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

    For overriding random weather behaviour, please read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.

    Please create separate files for every class, module and test suite.

    In code review we'll be hoping to see:

    All tests passing
    High Test coverage (>95% is good)
    The code is elegant: every class has a clear responsibility, methods are short etc.
    Reviewers will potentially be using this code review rubric. Referring to this rubric in advance will make the challenge somewhat easier. You should be the judge of how much challenge you want this weekend.

    BONUS

    Write an RSpec feature test that lands and takes off a number of planes
