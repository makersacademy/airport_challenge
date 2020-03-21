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

Task
-----

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

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.


**BONUS**

* Write an RSpec **feature** test that lands and takes off a number of planes

Approach
--------
### User story 1

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```

#### Feature - instruct plane to land at an airport

Exercise feature using irb:

```bash
2.6.5 :001 > require './lib/plane'
 => true 
2.6.5 :002 > plane = Plane.new
 => #<Plane:0x00007fb1760cd328> 
2.6.5 :003 > plane.land("Heathrow")
 => nil 
2.6.5 :004 > 
```

### User story 2

```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

#### Feature - instruct plane to take off from an airport and confirm it is no longer at the airport

Exercise feature using irb:

```bash
2.6.5 :001 > require './lib/plane'
 => true 
2.6.5 :002 > plane = Plane.new
 => #<Plane:0x00007ffa3c09b5f8> 
2.6.5 :003 > plane.take_off
 => "No longer in the airport" 
2.6.5 :004 > 	
```

### User story 3

```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
```

#### Feature - if the airport is full, it should prevent planes from landing

airport = Airport.new
airport.full = true
airport.full? = true
plane = Plane.new
plane.land(airport) => raise error