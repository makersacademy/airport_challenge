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

## Introduction

This is my solution to the first Makers weekend challenge where the objective is to design a program to help planes land at airports. 

The solution builds on my learnings from the week including TDD, debugging, mocks/doubles & dependancy injection. This problem consists of 6 main user stories and and number of edge cases that need to be accounted for. 

My solution:
- all 6 user stories completed
- built entirely through TDD with 100% test coverage
- all RSpec tests passing
- uses dependancy injection to stub randomness

The following class diagram was created during the planning phase:
![class_diagram](./docs/class_diagram.png)

## How to use

#### To set up the project

Clone this repo and then run 

```
bundle install
```
#### To create an airport

Open IRB and load the 'airport.rb' file in the 'lib' folder. Instantiate an airport by calling Airport.new. The airport class and instruct instances of the Plane class to land or take off.

```
airport_challenge % irb
2.7.3 :001 > require './lib/airport'
 => true 
2.7.3 :002 > jfk = Airport.new
 => #<Airport:0x00007f9cd88d3c78 @planes=[], @capacity=20, @weather=#<Weat... 
```

#### To create a plane

Open IRB and load the 'plane.rb' file in the 'lib' folder. Instantiate a plane by calling Plane.new.

```
2.7.3 :003 > require './lib/plane'
 => true 
2.7.3 :004 > boeing_747 = Plane.new
 => #<Plane:0x00007f9cd913c798 @location="air"> 
2.7.3 :005 > 
```

#### Airport methods

An airport can land a plane with land(plane) and instruct a plane to take off with take_off(plane). Guard conditions and logic have been implemented such that:
- A plane cannot land if the airport is full
- A plane cannot land or take off in bad weather (weather is randomly generated)
- A plane cannot be instructed to land if it had done so already
- A plane cannot take off if it's not at the airport 

If any of the conditions above are met then the user is given an error message.

## Testing

All testing was completed in RSpec, a screenshot of the output is below:
![tests](./docs/rspec_tests.png)

## User stories

The following user stories were implemented as part of this project:
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


Original README [here](https://github.com/makersacademy/airport_challenge)