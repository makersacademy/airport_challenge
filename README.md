# Airport Challenge in Ruby

Please also see my solutions to this challenge in [JavaScript](https://github.com/AdamusBG/airport_challenge-js) and [Java](https://github.com/AdamusBG/airport_challenge-java).

This is my solution to [this](https://github.com/makersacademy/airport_challenge) challenge.

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

## User stories

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

## Information

The program will need to be run in a REPL to test, see the featureSpec file for guidance on how this would work.  

Edge cases considered:  
* Planes will not be able to take off from an airport that they are not currently in  
* Planes will not be able to take off when already in flight  
* Planes cannot land at an airport if they are already at an airport  
