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
## Task
I am creating a program to emulate airports. This will include the landing and taking-off of planes subject to weather conditions.\
\
I will accomplish this by using TDD to create tests that are based on the user stories and then write code that will then pass these tests to ensure that the spec been met.\
\
I will then need to consider edge cases such as having planes only being able to take off from the airports they are in, planes already in flight cannot take off or be inside a airport, planes that have already landed can not land again and must be in a airport.

## Instructions
Clone this repository to your desired location.\
\
Run RSpec in the `airport_challenge` directory whilst in the terminal in order to run the unit tests.\
\
Alternatively, run irb and load the file `airport.rb` located inside the lib directory. Create a new airport within irb by using `Airport.new`. Create planes with the command `Plane.new` and use the methods `land(plane)` and `take_off(plane)` (plane being any Planes that have been created). If you wish to manage these planes and airports easier, feel free to give them variable names, i.e `airport1 = Airport.new`, `plane1 = Plane.new`, `plane2 = Plane.new` and etc. There is a default capacity of 100 airplanes for each Airport created, this can be changed during the creation by simply doing `Airport.new(num)` with num being the capacity you wish for the Airport to have.\
\
If you wish to test the Airport under stormy conditions, feel free to create new airports until that is the case (there is a 1/10 chance for it to be stormy at a airport) - do note that in stormy conditions you cannot land any planes nor have any planes take off!


## User Stories

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
## Table representation of User Stories

|  Objects              |  Methods          |
| --------------------- | ----------------- | 
| Airport               | land(plane)       |
| Airport               | take_off          |
| Airport               | full?             |
| Airport               | capacity          |
| Weather               | stormy            |

Here is a table that shows potentially what methods each object will need in order to satisfy the user stories.

