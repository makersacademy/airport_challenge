# Airport Challenge

Airport Challenge is a programme to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  

## My approach to solving this challenge

*Update here*
*If unfinished outline how you'd plan to finish it*

**My checklist for TDD process:**

For each user story:
- [] Discuss user stories
- [] Extract verbs and nouns into functional representation
- [] discuss and make domain model
- [] discuss to imagine feature test

- [] for each feature:
- []write and run a failing feature test

- [] x.times do 
- []write failing unit test - red
- []simplest code to pass unit test - green
- []refactor code - (iterative cycle itself - retest each time)

- []run a passing feature test

**Reflection on my process**

*Ass self reflection here*

**Code review feedback**

*Add code review feedback here*

## Test Coverage

*Update here*

## User Stories 
Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

## User Story 1

As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

Nouns:
Verbs: 