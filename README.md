Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(_Manuela__)
          \_____\____@@MAKERS ACADEMY@@,-~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/---Sabatino-`````
            = = =  ===(_________)

```
My personal solution of my first weekend challenge at [Makers Academy](http://www.makersacademy.com/).  

First Approach
---------
My first Approach was based on extracting a Domain Model from each User Story that helped me to pass from the Feature test (using irb) to Unit test (RSpec). From my Models I extracted 3 Classes and 3 relative Specs. I commit only my final result - one test cycle - where all my tests passed, since I believe I will modify my code in the future adding more methods and making it more readable.

My code is well encapsulated in the Airport class to keep things easier. After making the code more complex, my next challenge will be to extract similar behaviour across classes to mixin and create a Module.


Instructions
---------

* Clone the repository from makersacademy [github account](https://github.com/makersacademy/airport_challenge) using
```$ git clone git@github.com:manuciao/airport_challenge.git
```

* Run the gem bundle
```$ gem install bundle
$ bundle
```
* Run makersinint to track my commits
```$ gem install makersinit
$ makersinit
```
* Start coding in irb
```$ irb
$ 2.2.3 :001 > require './lib/airport'
$ 2.2.3 :002 > airport = Airport.new
 => #<Airport:0x007f85630a8030 @planes=[], @capacity=25, @weather=#<Weather:0x007f85630a3fa8>>
$ 2.2.3 :003 > plane = Plane.new
 => #<Plane:0x007f856309b2b8>
$ 2.2.3 :004 > airport.land(plane)
 => [#<Plane:0x007f856309b2b8 @working=false>]
$ 2.2.3 :005 > airport.takeoff(plane)
 => #<Plane:0x007f856309b2b8 @working=true>
$ 2.2.3 :010 > weather.stormy?
 => false
$ 2.2.3 :011 > weather.stormy?
 => true
```

User Stories
---------
We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed

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

Contributors
---------

* Manuela Sabatino [github](https://github.com/ManuCiao/airport_challenge), [linkedin](https://uk.linkedin.com/in/mnsabatino)
