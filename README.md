Airport Challenge
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

Summary 
---------
We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. More details about the project can be found [here](https://github.com/makersacademy/airport_challenge). 

This project has 12 passing tests and 100% test coverage. The project is made up of two classes - the Airport class and the Plane class. 

Plan 
---------
User stories, worked out in collaboration with the client: 

```
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
- Test drive classes/modules to satisfy the user stories. 
- Use a random number generator to set the weather (it's normally sunny but sometimes stormy). 
- Stub to override random weather. 
- Code should defend against edge cases e.g. inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

How to Install and Run 
-------
1. Clone this repo to your local machine. 
2. Run the command `gem bundle install` if you don't have bundle already. 
3. Run `bundle install` when the installation completes. 
```
irb
2.6.0 :001 > require './lib/airport.rb'
 => true
2.6.0 :002 > airport = Airport.new
 => #<Airport:0x00007fe592157190 @capacity=100, @planes=[], @status=:flying>
2.6.0 :003 > plane = Plane.new
 => #<Plane:0x00007fe592133c18>
2.6.0 :004 > airport.land_plane(plane)
 => :grounded
```

How to Run Tests 
-------
1. Run the command `rspec` in the terminal. 

### Project Status
By 22nd September 2019, all of the user stories have been implemented. However, I need to fix two tests in the airport_spec that have been commented out for now and I would like to add a test that a plane can land when it's sunny. 
I would also like to reassess the way I'm declaring the flying / grounded status of the plane and I would like to look at moving the weather function into its own class. See [my plan](https://github.com/jessmar94/airport_challenge/blob/master/plan.md) for more details and for a breakdown of the user stories. 
