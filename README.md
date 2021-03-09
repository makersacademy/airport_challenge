# Airport Challenge

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

## Brief
---------
The purpose of this project was to create a program to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny, although occasionally it may be stormy, in which case no planes can land or take off. The program also needs to ensure against edge cases such as; planes only being able to take off from airports they are in; planes already flying cannot take off or be in an airport; and planes that are landed cannot land again.

## User Stories

```
  1.  As an air traffic controller,
      So I can get passengers to a destination,
      I want to instruct a plane to land at an airport

  2.  As an air traffic controller,
      So I can get passengers on the way to their destination,
      I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

  3.  As an air traffic controller,
      To ensure safety,
      I want to prevent landing when the airport is full

  4.  As the system designer,
      So that the software can be used for many different airports,
      I would like a default airport capacity that can be overridden as appropriate

  5.  As an air traffic controller,
      To ensure safety,
      I want to prevent takeoff when weather is stormy

  6.  As an air traffic controller
      To ensure safety
      I want to prevent landing when weather is stormy
```

## Getting Started

Clone the repository from GitHub:
```
$ git clone https://github.com/PiperS52/airport_challenge.git
$ cd airport-controller
```
Load the dependencies:
```
$ bundle install
```
