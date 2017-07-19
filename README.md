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

Authored by: Nigel Said

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


Review
------

**The Good**

* Code *should* be a complete solution to the user stories.

* Code *should* guard against edge cases (such as 'teleportation' of planes)

* Tests pass and test coverage is high

* Rubocop gives all-clear (no offences)

**The Bad**

* While all code was featured tested on IRB while it was being built, not all rspec unit tests were written before the actual code was inputted into the LIB files - this is a failing in terms of TDD.  Rspec unit tests were created thereafter, first in a failing state, and then to pass.

* Code isn't as DRY as possible, e.g. The @@Plane #land and #take_off call another method twice (first to see if it passes and if it doesn't, a second time to generate the message indicating why it hasn't).

**The Ugly**

* Rspec tests (Require a lot of refactoring)

* On reflection, Safety module is probably unnecessary and the code within could be distributed to other classes in a simpler fashion. 


Example of Code
---------------

```
2.4.0 :034 > plane1 = Plane.new("Air Force One")
 => #<Plane:0x007fa59d954170 @name="Air Force One", @status="airborne"> 
2.4.0 :035 > airport1 = Airport.new("JFK Airport")
 => #<Airport:0x007fa59d925c30 @name="JFK Airport", @planes=[], @capacity=5> 
2.4.0 :036 > plane1.land(airport1)
 => "Air Force One has landed in JFK Airport" 
2.4.0 :037 > plane1.land(airport1)
 => "Air Force One already on the ground" 
2.4.0 :038 > plane1.take_off(airport1)
 => "Air Force One has taken off from JFK Airport" 
2.4.0 :039 > plane1.take_off(airport1)
 => "Take Off not possible: Air Force One not present" 
2.4.0 :040 > 
```

For a more comprehensive example of the above (not using IRB), go into the main folder on command-line and run the following:
```
$ruby ./spec/feature_test.rb
```
N.B. Running this more than once might generate different results due to the @@Weather...




<p align="center">
<b>FIN</b>
</p>



