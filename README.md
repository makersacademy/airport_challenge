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

To try the program out yourself, open a terminal and navigate to a directory that you would like this repository saved in and then follow the instructions below. Note that this requires you to have Ruby installed.  

```
$ git clone https://github.com/AdamusBG/airport_challenge.git
$ cd airport_challenge
$ irb
```

This will then open the interactive ruby REPL. The below is an example of how it might be used.  
If you are trying this out yourself, you must include the first two 'require' statements, following that the behaviour may differ when tested as parts of the program rely on randomness.  
Note that I have slightly condensed the irb output to make it more readable, as well as removing the stack trace from the intentionally triggered error.  

```
2.6.5 :001 > require './lib/airport'
 => true 
2.6.5 :002 > require './lib/plane'
 => true 
2.6.5 :003 > plane1 = Plane.new()
 => #<Plane:0x00007fe953a...
2.6.5 :004 > airport1 = Airport.new()
 => #<Airport:0x00007fe953131...
2.6.5 :005 > airport2 = Airport.new()
 => #<Airport:0x00007fe9531...
2.6.5 :006 > plane1.land(airport1)
 => [#<Plane:0x00007fe953a...
2.6.5 :007 > plane1.take_off(airport2)
StandardError (The pane can't take off from an airport that it is not at)
2.6.5 :008 > plane1.take_off(airport1)
 => #<Plane:0x00007fe953a...
2.6.5 :009 > plane1.land(airport2)
 => [#<Plane:0x00007fe953a...
2.6.5 :010 > plane1.at_airport?(airport1)
 => false 
```

For an example of how the program would work with more planes and airports see the feature test file at './spec/feature_spec.rb'.  

Edge cases considered:  
* Planes will not be able to take off from an airport that they are not currently in  
* Planes will not be able to take off when already in flight  
* Planes cannot land at an airport if they are already at an airport  

To run the tests proving that the above edge cases are handled, enter run `rspec` in your terminal after navigating to this directory.  
