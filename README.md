# Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

Our first weekend challenge as the February 2022 cohort of Makers Academy, a 12-week development boot camp in London, was to write a basic program controlling the flow of planes at an airport. To do this, we were provided with six user stories, which I detail one at a time in [My Approach](#my-approach).

## Getting started

`git clone path-to-your-repo`
`command_to_install_dependencies` (e.g. `bundle`)

## Usage

`command_to_start` (e.g. `rackup` or `rails s`)
Navigate to `http://localhost:4567/`


## Running tests

`test_command` (e.g. `rspec`)

## My Approach

**NB:** I ended this challenge more familiar with basic markdown than when I started it! Were I to do it all again, I'd quote blocks of my code to illustrate my progress rather than describe each step with just text as I have done here.

The first user story was as follows:

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```

First I organised the objects and messages into a table:

| Objects | Messages |
| --- | --- |
| Controller | |
| Plane | Instruct |
| Airport | Land |

Then my approach was to:

* run a feature test in IRB, simply trying to create a new Airport object (airport = Airport.new) - this returned the NameError "uninitialized constant Aiport"

* create airport_spec.rb and airport.rb files in my local repo

* write the start of my first unit test in the airport_spec.rb file, simply an empty 'describe Airport' block - this threw the NameError "uninitialized constant Airport"

* commit and push with the accompanying messge 'Created airport lib and spec files'

* create an Airport class in airport.rb - RSpec now passes as expected with 0 examples, 0 failures

* create a new Airport object in IRB, which was now possible, but airport.land(plane) throws up "undefined local variable or method `plane'" for that object

* flesh out the unit test, expecting Airport to respond to land with 1 argument, which threw an RSpec error as I had no land method yet

* define my land method in the Airport class with (plane) as a parameter, which now passed RSpec

* run another feature test in IRB, whereupon I tried to create a new plane object and this threw an "uninitialized constant" error, so I created a plane.rb file containing an empty Plane class

On to the second user story:
 
```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

Here my approach was to:

* start with a feature test in IRB, where "airport.take_off(plane)" raised an "undefined method error" as expected

* write a simple unit test expecting Airport objects to respond to a take_off method with (plane) as a parameter - this also gave an error, so I defined a method in the Airport class

* write another basic unit test expecting Airport objects to respond to a 'plane' method in order to see a plane and ensure it was no longer at an airport - this failed

* create an empty plane method in my Airport class in order to pass RSpec tests

* describe my land method in a unit test, creating a new plane object inside it and expecting landing it to equal 'plane' - this failed in RSpec, returning nil instead of the new plane object, so I added 'plane' inside my land method to get it to pass (although it still returns nil in IRB)

* return focus to my take_off method as per the user story (I got a bit sidetracked!) and write a unit test describing the take_off method, expecting it to equal a string saying 'The plane has left the airport' - this fails, getting nil, so I insert that string into the method which makes it pass RSpec and work in IRB

* change the take_off message to a constant at the top of the class in case I want to change it later

Third user story:

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
```

Here I decided to:

* write a unit test for my land method, landing one plane to start with and then expecting it to raise an error when another was landed - but at this stage, as confirmed by a feature test, I could land unlimited planes - as expected, the unit test failed when running RSpec

* define an initialize method containing an empty array to hold planes and a (capacity) parameter, after which I updated my methods to act in accordance with this new array - this still failed, so I updated my unit test for the land method to reflect the capacity I'd just introduced, and I commented out old tests which were now throwing errors as a result (I later figured out how to refactor them into working and commented them back in) - it now passed RSpec and I got the desired "Airport full" RuntimeError in IRB

Fourth user story:

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

Here I decided to:

* write a unit test describing initialization, expecting it to raise an error when 31 planes are landed with a capacity of 30 - this didn't work, so I changed to an attr_accessor method for capacity and updated the unit test with Airport::DEFAULT_CAPACITY instead of a hard-coded 30 - this made it pass

* commit and push, since I suddenly realised I'd gotten so into the exercise I'd forgotten to do so! This is something I resolve to be more methodical about in future

* take out the empty plane method and replace it with an attr_reader, updating the relevant test in the process - I also managed to get an old take-off test I'd commented out working by creating a new Airport instance inside it rather than just using the **subject** keyword

Fifth user story:

```
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 
```

My approach here was to:

* make a respond_to unit test after airport.weather threw an error in IRB, then define an empty weather method when this also failed as expected

* write another unit test allowing an airport to receive stormy weather (for this I used a stub with an **allow** line) - RSpec failed as it expected an exception where none was raised, and airport.weather returned nil in IRB

* create a random number generator from 1 to 100 with 1 assigned to 'stormy', the rest to 'sunny', and I refactored this from an if/else statement into a ternary operator then added a guard clause to my take_off method - now everything passed

* add a unit test expecting taking off a plane in sunny weather to result in my default take-off message, which passed

Sixth user story:

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

Here I chose to:

* more or less repeat the above process, using **raise** instead of **fail** as a guard clause just to ascertain that the two are in fact synonymous, which my results suggest they are

* group weather-related tests into context blocks, which threw a failure in an earlier test so I added a stub to it making it sunny and this made it pass

[Jonny Abrams](https://github.com/jonnyabrams)

[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)