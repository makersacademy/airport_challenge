# Airport Challenge
The first weekend challenge at Makers Academy

## Task
The task was to create a program that fulfilled the following user stories

```
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
```

## My Approach
I followed a TDD approach while making the program. I took a user stroy and broke it down into objects and messages. I then wrote tests that matched the requirements from the user story, after which I wrote the code to pass the test. This process was repeated for each user story.

The program follows OOD; classes were made for each object with methods to fulfill their responsibilites. The tests were isolated and achieved 100% coverage.
