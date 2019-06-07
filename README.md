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

[Getting started](#getting-started) | [How to use](#how-to-use) | [Tests](#tests) | [User stories](#user-stories)

```

A Makers weekend challenge that runs on REPL. A plane can land or take off from an airport depending on if the weather is stormy or not.

## Getting started

`git clone https://github.com/riyadattani/airport_challenge`
`gem install bundle`
`bundle`

## How to use

Require and run in `irb`

## Tests
Run `rspec` in terminal

## User stories

As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
