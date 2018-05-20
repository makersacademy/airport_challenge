# Airport_challenge

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

This project is our first weekend challenge (completed solo on 19-20th May 2018). We were given user stories and instructed to write the software to control the flow of planes at an airport. 

## Motivation 

This project has been created to help airports (mainly airport traffic controllers) control the flow of planes. It has been designed with the idea that it can be used across multiple airports in mind, so has some default settings (e.g. capacity) that can be overridden. 

## Getting started

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`

## Usage

Navigate to the root folder in this project directory on the command line to begin. 

Use the following commands on the command line: 

**Airport.initialize(capacity)** -> to change the capacity of the aiport (airport is set with a default capacity of 30)<br />
**Airport.land(plane)** -> to instruct a plane to land at an airport<br />
**Airport.full?** -> to check if the airport is full<br />
**Airport.take_off(plane)** -> to instruct a plane to take off from an airport. The plane argument is optional, if none is entered it will return the next available plane<br /> 
**Airport.check_plane(plane)** -> to confirm that the plane is no longer in the airport<br />
**Airport.runway_closed?** -> to check if the airport is able to takeoff/land planes<br />
**Airport.planes** -> to show all the current planes in the hangar<br />
**Airport.stormy?** -> will return true if the weather is stormy (note that planes can't land or take off in stormy conditions)

**Plane.flying?** -> will return true if the plane is flying, or false if it's grounded 


## Tech/Framework used 

Built in Ruby (version 2.5.0)<br />
Tested using Rspec (version 3.7) 


## Running tests

run `rspec` from the projects root directory. 

## Credits 

With thanks to the following resources that have helped me on this project

* Akash Nimare for his blog on README's - https://medium.com/@meakaakka/a-beginners-guide-to-writing-a-kickass-readme-7ac01da88ab3

## Skills I used creating thing project 

TDD</br />
* Writing all tests before code 
* Unit testing classes in isolation (using doubles)
* Use Rspec matchers 
* Write guard conditions 
* Use constants
* Extract domain models from user stories, and turn them into feature tests.

