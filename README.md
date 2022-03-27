# Airport Challenge

This is my submission for the Weekend Challenge of the first full-course week at Makers Academy. The challenge exercises the skills I have learned as well as one or two more. I tackled it solo.

Read on to understand the scenario, my task and my approach to solving it.

## Scenario

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

## My task

My task was to test drive the creation of a set of classes/modules to satisfy all the above user stories. I needed to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In my tests, I needed need to use a stub to override random weather to ensure consistent test behaviour.

My code needed to defend against edge cases such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

## Getting started

`git clone https://github.com/almorcrette/airport_challenge.git`

## Usage

`irb -r ./lib/plane.rb'`


## Running tests

`rspec`

## File manifest

* `README.md`: My README file
* `INSTRUCTIONS.md`: Makers challenge instructions
* `feature_spec.rb`: An attempt at a feature spec. WIP 
In `./lib`
* `plane.rb`: `Plane` class
* `airport.rb`: `Weather` class
* `weather.rb`: `Airport` class
In `./spec`
* `plane_spec.rb`: Rspec file `Plane` class
* `airport_spec.rb`: RSpec file for `Airport` class
* `weather_spec.rb`: RSpec file for `Weather` class


## My approach to solving the problem

Here are the user stories that worked out in collaboration with the imaginary client.

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

### Step 1: Functional representation of user stories

To get me started, I identified all the nouns and verbs in the user stories.

I then considered for each user story which of those nouns and verbs relate to the end users of the software and what they need to be able to do with it, and which were about how the software itself needs to function, i.e. pertaining to the **functional representation** of the user stories in terms of **objects** in the program.

I mapped out functional representation of each story in terms of _objects_, _messages_, _parameters_, _behaviour_, and where more relevant, _objects_, _constants_, and _instance variables_.

Here's a consolidated mapping for an overall picture of the structure of of the program as a whole, as follows:

**Objects and messages**

| Objects     | Messages        | Parameters   | Behaviour                    |
| ------------| ----------------| -------------| -----------------------------|
| Weather     | Stormy?         |              | Reports whether stormy       |
| Airport     | Full?           |              | Reports whether full         |
| Airport     | Change capacity |              | Changes capacity             |
| Plane       | Land            | Airport      | Lands at airport             |
|             |                 |              | Prevents landing if stormy   |
|             | Take off        | Airport      | Take off from airport        |
|             |                 |              | Prevents take-off if stormy  |
|             | Report          |              | Report location              |

**Objects and states**

| Objects     | Constants          | Instance variables   | 
| ------------| -------------------| ---------------------| 
| Weather     | Weather types      | Stormy               |
| Airport     | Default capacity   | Capacity             |
|             |                    | Hangar               |
| Plane       |                    | Location             |

### Step 2: Feature testing Functional representation of user stories

### Step 3: Unit testing Functional representation of user stories

### Step 4: Production code to pass test

### Step 5: Refactor

### Step ...: Repeat till all exceptions satisfied

### Step ...: Test features to confirm behaviour for user

### Step ...: Ensure 95% + test coverage

### Step ...: Run Rubocop and clean up code

### Step ...: Tidy up README

*steps not had time for*
* Isolating tests
* Fully implement a feature test on RSpec

