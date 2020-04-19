# Airport Traffic Tracker for Traffic Controllers

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

## Brief description of what the project is

This project includes software that enables a user to control the flow of planes at an airport.

It includes the following features for air traffic controllers:

1. Enabling planes to land at an airport.
2. Instructing planes to take off from an airport and confirm it is no longer in the airport
3. The ability to track airport capacity. This is set at a default value and can be overridden as appropriate
4. Prevent landing a plane when an airport is full

All in all, this is incredibly useful for air traffic controllers as it can protect against human error (e.g. in tracking airport capacity) and enables air traffic controllers to track multiple airports and planes.

Note: You will notice a file which includes a program that randomises weather. This file exists as the following features which would’ve made use of this functionality and were intended to be implemented could not be completed due to time constraints.

1. Ensuring that takeoff is prevented when the weather is stormy
2. Ensuring landing is prevented when the weather is stormy

## Getting started

To run this on your computer, complete the following steps:

1. Fork this repository, and clone it to your local machine
2. If you do not have bundle installed already, run the command ‘gem install bundle’
3. When the installation completes, run bundle

Also, note that this project requires Ruby version - 2.6.5


## Running tests

To run tests, complete the following steps

1. Open your terminal and make sure you are in the correct folder (airport_challenge).
2. Type the command ‘rspec’ in the terminal to run all tests

## How to contribute

If you would like to contribute to this project, you can follow the instructions below

1. Clone this repository to your local computer
2. Create a new branch: $ git checkout https://github.com/hiboabd/airport_challenge -b name_for_new_branch.
3. Make changes and test
4. Submit Pull Request with comprehensive description of changes

## Acknowledgements

In order to ensure I was making the correct progress on this challenge, I used the Makers Academy Code Review Rubic for this challenge as a reference. It can be found [here](https://github.com/makersacademy/airport_challenge/blob/master/docs/review.md).
