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

* create an Airport class in airport.rb - rspec now passes as expected with 0 examples, 0 failures

* create a new Airport object in IRB, which was now possible, but airport.land(plane) throws up "undefined local variable or method `plane'" for that object

* flesh out the unit test, expecting Airport to respond to land with 1 argument, which threw an RSpec error as I had no land method yet

* define my land method in the Airport class with (plane) as a parameter, which now passed RSpec

* run another feature test in IRB, whereupon I tried to create a new plane object and this threw an "uninitialized constant" error so I created a plane.rb file containing an empty Plane class

On to the second user story:
 
```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

Here my approach was to:

* start with a feature test in IRB, where "airport.take_off(plane)" raised an "undefined method error" as expected

* write a simple unit test expecting Airport objects to respond to a take_off method with (plane) as a parameter - this also gave an error so I defined a method in the Airport class

* write another basic unit test expecting Airport objects to respond to a 'plane' method in order to see a plane and ensure it was no longer at an airport - this failed

* create an empty plane method in my Airport class in order to pass RSpec tests

* describe my land method in a unit test, creating a new plane object inside it and expecting landing it to equal 'plane' - this failed in Rspec, returning nil instead of the new plane object, so I added 'plane' inside my land method to get it to pass (although it still returns nil in IRB)

* return focus to my take_off method as per the user story - I got a bit sidetracked! - and write a unit test describing the take_off method, expecting it to eq a string saying 'The plane has left the airport' - this fails, getting nil, so I insert that string in the method which makes it pass RSpec and work in IRB

* change the take_off message to a constant in case I wanted to change it later

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
```
* right now in IRB I can do airport.land(Plane.new) an unlimited number of times so I make a unit test for land method landing one plane then expecting to raise error when another is landed

* this RSpec fails so add fail guard to land method - still failing so I need to initialize with array and (capacity) and update my methods to act in accordance with array - still failing so I update my unit test for the land error raise to reflect new capacity, and I comment out old tests which are now throwing errors (presumably due to method changes) - it now passes RSpec and I get the Airport full RuntimeError in IRB as desired

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

* unit test describing initialization expecting it to raise_error when 31 planes are landed and capacity is 30 - this doesn't work - I make capacity attr_accessor and update unit test with Airport::DEFAULT_CAPACITY instead of 30 and it passes

* I now realise I've got so into it I've forgotten to commit - so I commit!

* Took out empty plane method and made attr_reader :planes, updated relevant test  - old take-off test I'd commented out I managed to get passing again by creating a new Airport instance in it rather than just using subject

```
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 
```

IRB airport.weather naturally throws an error - do respond_to unit test then define empty method - wrote unit test allowing airport to receive stormy weather with stub (allow line) - RSpec expected exception but nothing was raised, and airport.weather in feature test returns nil

* made random number generator 1..100 with 1 as stormy, rest as sunny, refactored it from if else into ternary then added guard clause to take_off - now everything passes

* just for good measure I added a unit test expecting taking off a plane in sunny weather to eq default take off message, this passed

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

repeat process above - rspec for unit test says Failure/Error - expected Exception 'Plane unable to land due to stormy weather' but nothing was raised, so I add it, this time trying out raise instead of fail to ascertain that they are in fact synonymous - this all passes

* looking at refactoring, notice my land and take off methods both violate the Single Responsibility Principle, so I create private methods to take care of adding and removing planes from the airport - I try this but it raises errors, so I put it back to how it was and resolve to learn more about that 

* grouped weather-related tests into context blocks, threw a failure in an earlier test so added a stub to it making it sunny and it passed

[Jonny Abrams](https://github.com/jonnyabrams)

[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)