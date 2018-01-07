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

BRIEF SUMMARY OF MY APPROACH BY JENNIFER

Before starting this challenge I read over quite a lot of notes and WGR to consolidate from the week and build my confidence through confirming what I already knew.  When I started the challenge, I had some issues with the gems and Ruby versions (despite changing to 2.4.0) so I altered the Gemfile itself to reflect 2.4.1 so that I could crack on and deal with this issue on Monday.

I approached the problem similarly to the Boris Bikes, by getting into the rhythm of feature testing then writing, running and passing RSPEC tests.  I spent some time considering responsibilities (as I wanted landing and taking off to be the plane's: the user story was explicit about 'instructing') but ended up assigning most responsibilities to the airport.  I'm not sure I would do it this way again.

Most of the stories were relatively straightforward to implement.  What I found more difficult were negotiating private methods, and keeping it DRY regarding the doubles.  There is so much unfamiliar language in my research that I need to continue to practice.  I would like to more thoroughly check for edge cases.

With more time I would also explore the feature test file, but I wanted to approach that with a fresh mind knowing that this part was done, as I have many questions about it.


Steps
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`

Instructions
------------

* To create an airport: Airport.new
* Default airport capacity: 2
* To check airport capacity: airport.capacity
* To set airport capacity: airport.capacity = 40
* To create a plane: Plane.new
* To land a plane: airport.land(plane)
* For a plane to take off: airport.take_off(plane)
N.B. this will confirm take off
* A plane will neither take off nor land if the weather is stormy

Irb usage
---------

2.4.0 :001 > require './lib/airport.rb'
 => true
2.4.0 :002 > airport = Airport.new
 => #<Airport:0x007fce66924f00 @planes=[], @weather=#<Weather:0x007fce66924ed8>, @capacity=2>
2.4.0 :003 > plane = Plane.new
 => #<Plane:0x007fce66821388 @airborne=true>
2.4.0 :004 > airport.land(plane)
 => [#<Plane:0x007fce66821388 @airborne=false>]


User Stories
------------

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


Reviewers will potentially be using this [code review rubric](docs/review.md).  

More detailed submission requirements/guidelines are in [CONTRIBUTING.md](CONTRIBUTING.md)

