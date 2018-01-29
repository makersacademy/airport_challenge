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

Instructions
---------
We have a request from a client to write the software to control the flow of planes at an airport.


Setting up the environment
--------------------------

1. Clone this repo into to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`
4. Install Rspec running 'gem install rspec'
5. Set up the project to use Rspec run the command 'rspec --init'


How to use
---------

The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

Here are the user stories that we worked out in collaboration with the client:

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

Tasks
-----

After reading the User Stories, I created a Domain Model drawing an abstract representation of the objects and messages and make more easy the use of feature tests. e.g


Objects           Messages

Plane             Land
Plane             Take Off
airport           Not landing if full
Weather           Not landing if stormy
Weather           Not taking off if


Next step, Use of feature test to have an idea about the Unit Test structure. e.g

2.5.0 :004 > airport = Airport.new
 => #<Airport:0x00007fe1598ba758 @hangar=[], @capacity=10, @weather=#<Weather:0x00007fe1598ba708>>
2.5.0 :005 > plane1 = Plane.new
 => #<Plane:0x00007fe15a132340>
2.5.0 :006 > plane2 = Plane.new
 => #<Plane:0x00007fe15a12af28>
2.5.0 :007 > weather = Weather.new
 => #<Weather:0x00007fe1598aae70>

 Plane landing:

2.5.0 :008 > airport.land(plane1)
 => "Plane has landed"
2.5.0 :009 > airport.land(plane2)
 => "Plane has landed"
2.5.0 :010 > airport.hangar
 => [#<Plane:0x00007fe15a132340>, #<Plane:0x00007fe15a12af28>]

 Plane taking off:

2.5.0 :011 > airport.take_off(plane2)
 => "Plane has taken off"
2.5.0 :012 > airport.hangar
 => [#<Plane:0x00007fe15a132340>]
2.5.0 :013 > aairport.capacity

Airport capacity and random weather :

2.5.0 :014 > airport.capacity
 => 10
2.5.0 :015 > weather.random_weather
 => "clear"
2.5.0 :016 > weather.random_weather
 => "stormy"


Those feature tests, gave me an idea about how objects and messages will interact togheter in an Unit Test.

Unit tests were performed and updated, rspec test was passed with 100% of coverage and Rubocop was used to make the code  more readable.


Version
-----

Ruby 2.5.0


Author
-----

Jenny Arenas
