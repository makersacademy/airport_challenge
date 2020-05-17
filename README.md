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

## Task

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

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

- I have allowed for planes to be able to land at the airport. 
- I have allowed for planes to be able to take off and confirm they are no longer at the airport.
- I have allowed alerts to advise if the airport is full.
- I have allowed for the airports default capacity to be changed as required.
- I have allowed for planes to prevent take off and landing if weather is stormy.

- I broke down the user stories into class structure’s and object messages. Throughout the creation of this program I used RSPEC to test my unit tests and IRB to feature test. I also used [Rubocop](https://github.com/rubocop-hq/rubocop) to tidy up my code.

## How to run:

```
irb(main):002:0> airport = Airport.new
=> #<Airport:0x00007f99a710c488 @hanger=[], @capacity=15>
irb(main):003:0> plane = Plane.new
=> #<Plane:0x00007f99a70fe888 @plane_stored=nil>
irb(main):004:0> airport.depart(plane)
#<Plane:0x00007f99a70fe888> departed!
```

