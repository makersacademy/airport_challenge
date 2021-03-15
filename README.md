# Airport

## Motivation
This is the first individual challenge set by Makers Bootcamp for the module of TDD. I worked on this task on my own using resources from the course, the Ruby and rspec documentation and my own notes.

## The Task
We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. Here are the user stories that we worked out in collaboration with the client:

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

#### Edge cases
• Planes can only take off from airports they are in.
• Planes that are already flying cannot take off and/or be in an airport.
• Planes that are landed cannot land again and must be in an airport.

## Approach to solving the challenge
I solved this challenge using TDD, as well as the BDD cycle as guidance. Below are the steps I took:

1. I analysed the user stories and made a table representation of the objects and the messages they take (e.g. Object: Airport, Message: land), as well as a few simple diagrams that show how the objects will use messages to communicate with one another.
2. I created feature tests using irb for each of the user stories.
3. Using the failed feature tests, I wrote unit tests to reproduce the errors seen at the previous stage.
4. Letting the errors from the unit tests guide me, I implemented features until the unit tests passed.
5. I refactored my code.
6. I finally checked that the feature that I implemented satisfied the used story, before moving on to the next story.

## Progress
• I implemented all the features outlined in the user stories.
• Edge cases were satisfied.
• The tests passed.
• Rubocop tests did not bring up any offences.
• Test coverage of around 99%.

#### Improvements
• There is still some repetition in the spec files that can be avoided with reorganisation of the tests and implementation of more "before do" blocks.
• Certain functions in the airport.rb file are lengthy and can probably be broken down into more individual functions.


## Tech used
• Ruby
• Rspec (tests)
• Rubocop (to ensure code quality)

## How to use
This program can be run from the command line typing:

ruby airport.rb
