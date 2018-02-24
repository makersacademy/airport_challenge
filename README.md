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

#README.md

For this weekend's Challenge, we had to take some user stories relating to an airport and build the airport satisfying all user stories. The user stories were:

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

The first thing I did was construct a test, after that, I started to build the programme and made the test pass. I continued doing this until I had an airport programme with all user stories incorporated.

So of the issues I faced arose when trying to decide whether or not to include a Plane class, as it was possible to complete this task without doing so. In the end I opted for adding the class as I figured there might be a situation where the client comes back to you and asks for more customisation, this would make any further work to the planes easier to do without disrupting the code in my Airport class.

I also had to figure out a way to randomise weather, I did this in a separate class. This wasn't too hard as ruby provides several ways to do this, I settled upon a method that utilised an array and the sample method, I gave the odds of it being stormy 1 out of 6.

When testing the weather, I used doubles and stubbing to mimic the weather and control whether or not it was sunny or stormy.

I wrote a feature test and some unit tests using rspec and I tested in irb all through this process.

## Specifications

To run this programme:
```
ruby airport.rb
```
