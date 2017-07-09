Airport Challenge
=================

# Makers Academy week 1 weekend challenge

This is a program to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. This also confirms whether the planes are in or out of the airport.

The user stories and full instructions can be seen in [INSTRUCTIONS.md][INSTRUCTIONS.md].

-Programming language: Ruby
-Test framework: Rspec
-Developed using TDD


## Getting started

1. Fork this repo, and clone to your local machine using `git clone git@github.com:ryandav/airport_challenge.git`
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`
4. Run the program with 'app.rb'


## Running tests

- RSpec
`test_command: rspec`

## Design of program:

Domain Model:

class: Airport
| Responsibilities    | Collaborators       |
| ------------------- |:--------------------|
| land                | Plane               |
| take_off            | Plane               |
| plane_in_airport?   | Plane               |
| check_weather       | Weather             |
| check_airport_full  |                     |
| capacity            |                     |
| planes              |                     |
| airport_name        |                     |

class: Plane
| Responsibilities    | Collaborators       |
| ------------------- |:--------------------|
| land_at             | Airport             |
| in_airport?         | Airport             |
| fly                 |                     |

module: Weather
| Responsibilities    | Collaborators       |
| ------------------- |:--------------------|
| stormy?             | Airport             |
