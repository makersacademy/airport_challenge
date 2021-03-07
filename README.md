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

Aiport is a software to control the flow of planes at an airport. 
The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  
User stories provided in collaboration with the client:

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



Aiport is test driven to satisfy all the above user stories. 
It also defends against edge cases such as planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport.

test double/mocking has been used to ovveride sunny weather to stormy within tests.
Stormy weather is rare, and based on a random number generator between 1-9 where all numbers are sunny, except 6 which represents stormy.


To feature test in irb:  
> require './lib/airport'  
  
example instances to test:  
> heathrow = Aiport.new (default capacity is 1)  
> gatwick = Airport.new(10) (default capacity overriden to be 10)  
> bertie = Plane.new('Bertie')  
> colin = Plane.new('Colin')  
> heathrow.land(bertie) => "Bertie has landed!" (provided weather is sunny)  
> heathrow.land(colin) => "A plane can't land, there's no room!" (heathrow only has a capacity of 1, bertie is already on the apron)  


