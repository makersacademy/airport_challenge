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

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller.
So I can get passengers to a destination.
I want to instruct a plane to land at an airport and confirm that it has landed.

|Objects               | Messages      |
|----------------------|:-------------:|
|Air traffic controller|               |
|Passengers            |               |
|Destination           |               |
|Plane                 |land           |
|Airport               |landed?        |

As an air traffic controller.
So I can get passengers on the way to their destination.
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport.

|Objects               | Messages      |
|----------------------|:-------------:|
|Air traffic controller|               |
|Passengers            |               |
|Destination           |               |
|Plane                 |take_off       |
|Airport               |taken_off?     |

As an air traffic controller.
To ensure safety.
I want to prevent takeoff when weather is stormy.

|Objects               | Messages      |
|----------------------|:-------------:|
|Air traffic controller|               |
|Plane                 |take_off       |
|Weather               |stormy?        |

As an air traffic controller.
To ensure safety.
I want to prevent landing when weather is stormy.

|Objects               | Messages      |
|----------------------|:-------------:|
|Air traffic controller|               |
|Plane                 |land           |
|Weather               |stormy?        |

As an air traffic controller.
To ensure safety.
I want to prevent landing when the airport is full.

|Objects               | Messages      |
|----------------------|:-------------:|
|Air traffic controller|               |
|Plane                 |land           |
|Airport               |full?          |

As the system designer.
So that the software can be used for many different airports.
I would like a default airport capacity that can be overridden as appropriate.

|Objects        | Messages       |
|---------------|:--------------:|
|System designer|                |
|Airport        |DEFAULT_CAPACITY|

```


=================

## Methodology

1. First break down the user stories and identify nouns and verbs to determine the classes and methods that would be required.

2. Created a files for each class: `Airport`, `Plane` and `Weather`.

3. Created spec files for each class: 'airport_spec.rb', 'plane_spec.rb' and later 'weather_spec.rb'.

4. Started writing tests to check functionality.

5. Used 'rubocop' to ensure best practice formatting.

6. Used 'review.md' to ensure I was following best practice.

7. Add methods to the corresponding classes to pass the tests.

=================

## Challenges

Despite my best efforts I was unable to remove the random behaviour of weather in my tests.

=================

## How to use

Bellow is a pry transcript of how the program runs from a users perspective:

```
[1] pry(main)> require './lib/airport'
=> true
[2] pry(main)> require './lib/plane'
=> true
[3] pry(main)> airport = Airport.new
=> #<Airport:0x007fc9b40e0e68 @capacity=2, @planes=[], @weather=#<Weather:0x007fc9b40e0d78>>
[4] pry(main)> plane_one = Plane.new
=> #<Plane:0x007fc9b392f6d8>
[5] pry(main)> airport.land(plane_one)
"Landed"
=> [#<Plane:0x007fc9b392f6d8>]
[6] pry(main)> plane_two = Plane.new
=> #<Plane:0x007fc9b423aef8>
[7] pry(main)> airport.land(plane_two)
"Landed"
=> [#<Plane:0x007fc9b392f6d8>, #<Plane:0x007fc9b423aef8>]
[8] pry(main)> airport.land(plane_two)
RuntimeError: This plane has already landed
from /Users/anthonycrisp/Desktop/Projects/Airport/airport_challenge/lib/airport.rb:18:in `land'
[9] pry(main)> plane_three = Plane.new
=> #<Plane:0x007fc9b40f2398>
[10] pry(main)> airport.take_off(plane_three)
RuntimeError: This plane has not landed yet
from /Users/anthonycrisp/Desktop/Projects/Airport/airport_challenge/lib/airport.rb:26:in `take_off'
[11] pry(main)> airport.land(plane_three)
RuntimeError: This airport is full
from /Users/anthonycrisp/Desktop/Projects/Airport/airport_challenge/lib/airport.rb:19:in `land'
[12] pry(main)> airport.take_off(plane_one)
"Taken off"
=> #<Plane:0x007fc9b392f6d8>
[13] pry(main)> airport.land(plane_three)
"Landed"
=> [#<Plane:0x007fc9b423aef8>, #<Plane:0x007fc9b40f2398>]
[14] pry(main)> airport.land(plane_three)
RuntimeError: Landing not permited due to poor weather conditions
from /Users/anthonycrisp/Desktop/Projects/Airport/airport_challenge/lib/airport.rb:17:in `land'
[15] pry(main)> airport.land(plane_three)
RuntimeError: This plane has already landed
from /Users/anthonycrisp/Desktop/Projects/Airport/airport_challenge/lib/airport.rb:18:in `land'
[16] pry(main)> airport.take_off(plane_two)
"Taken off"
=> #<Plane:0x007fc9b423aef8>
[17] pry(main)> airport.planes
=> [#<Plane:0x007fc9b40f2398>]
[18] pry(main)> airport.take_off(plane_three)
"Taken off"
=> #<Plane:0x007fc9b40f2398>
[19] pry(main)> airport.planes
=> []
[20] pry(main)> airport.land(plane_two)
RuntimeError: Landing not permited due to poor weather conditions
from /Users/anthonycrisp/Desktop/Projects/Airport/airport_challenge/lib/airport.rb:17:in `land'
[21] pry(main)> airport.land(plane_two)
"Landed"
=> [#<Plane:0x007fc9b423aef8>]
[22] pry(main)> airport.take_off(plane_two)
"Taken off"
=> #<Plane:0x007fc9b423aef8>
[23] pry(main)> airport.land(plane_three)
"Landed"
=> [#<Plane:0x007fc9b40f2398>]
[24] pry(main)> airport.land(plane_one)
"Landed"
=> [#<Plane:0x007fc9b40f2398>, #<Plane:0x007fc9b392f6d8>]
[25] pry(main)> airport.take_off(plane_two)
RuntimeError: This plane has not landed yet
from /Users/anthonycrisp/Desktop/Projects/Airport/airport_challenge/lib/airport.rb:26:in `take_off'
[26] pry(main)> airport.land(plane_two)
RuntimeError: This airport is full
from /Users/anthonycrisp/Desktop/Projects/Airport/airport_challenge/lib/airport.rb:19:in `land'
[27] pry(main)> airport.take_off(plane_three)
"Taken off"
=> #<Plane:0x007fc9b40f2398>
[28] pry(main)> airport.land(plane_two)
"Landed"
=> [#<Plane:0x007fc9b392f6d8>, #<Plane:0x007fc9b423aef8>]
[29] pry(main)> airport.take_off(plane_one)
"Taken off"
=> #<Plane:0x007fc9b392f6d8>
[30] pry(main)> airport.take_off(plane_three)
RuntimeError: Take off not permited due to poor weather conditions
from /Users/anthonycrisp/Desktop/Projects/Airport/airport_challenge/lib/airport.rb:25:in `take_off'
[31] pry(main)> airport.take_off(plane_three)
RuntimeError: This plane has not landed yet
from /Users/anthonycrisp/Desktop/Projects/Airport/airport_challenge/lib/airport.rb:26:in `take_off'
[32] pry(main)> airport.land(plane_three)
"Landed"
=> [#<Plane:0x007fc9b423aef8>, #<Plane:0x007fc9b40f2398>]
[33] pry(main)> airport.take_off(plane_two)
"Taken off"
=> #<Plane:0x007fc9b423aef8>
[34] pry(main)> airport.take_off(plane_three)
"Taken off"
=> #<Plane:0x007fc9b40f2398>
[35] pry(main)> airport.planes
=> []
[36] pry(main)>

```
