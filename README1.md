# Airport_challenge

This project is our first weekend challenge (completed solo on 19-20th May 2018). We were given user stories and instructed to write the software to control the flow of planes at an airport. 

## Motivation 

This project has been created to help airports (mainly airport traffic controllers) control the flow of planes at their airport. It has been designed with the ability to use across multiple airports in mind, so has some default settings (e.g. capacity) that can be overriden. 

## Getting started

`Fork this repo, and clone to your local machine`
`Run the command gem install bundle (if you don't have bundle already)`
`When the installation completes, run bundle`

## Usage

Navigate to the root folder in this project directory on the command line to begin. 

Use the following commands on the command line: 

Airport.initialize(capacity) -> to change the capacity of the aiport (default is....................)
Airport.land(plane) -> to instruct a plane to land at an airport
Airport.full? -> to check if the airport is full 
Airport.take_off -> to instruct a plane to take off from an airport 
Airport.check_plane(plane) -> to confirm that the plane is no longer in the airport
Airport.runway_closed? -> to check if the airport is able to takeoff/land planes
Airport.planes -> to show all the current planes in the hangar 


## Tech/Framework used 

Built in Ruby (version 2.5.0)
Tested using Rspec (version 3.7) 


## Running tests

run `rspec` from the projects root directory. 

## Credits 

With thanks to the following resources that have helped me on this project

* Akash Nimare for his blog on README's - https://medium.com/@meakaakka/a-beginners-guide-to-writing-a-kickass-readme-7ac01da88ab3
