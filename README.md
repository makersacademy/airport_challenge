Airport Challenge
=================

Task
-----

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

Approach
-----

I approached the challenge by creating three modules:
- `Plane`
- `Airport`
- `Weather`

The user is able to create instances of plane and airport, and then proceed to land/take-off the planes at/from the given airports.

I initially understood the challenge to only require one airport. For that reason, I created Weather such that no instances of it are required, it is a class module only. Since weather is generated randomly, and is not saved, it didn't think it was necessary to have it based on creating instances. Once I understood the challenge required multiple airports I did consider changing this, but even if weather instances were used, it would still be generated randomly and the functionality would be the same. However, it would be good for the system to be able to report the weather at a given location (i.e. as a future user story).

All of the modules were written using TDD, and a spec file exists for each one. I've used verified doubles extensively as well as stubbed methods. The project reports 99.6% test coverage with Coveralls.

Problems
-----

There is significant repeated code in the spec files, in particular `plane_spec.rb`. This tends to be where instance doubles are being used. While I was able to create a method `set_sunny` to provide my `Weather` class double to my tests, I was not able to achieve a similar solution for instance doubles. Whenever I tried to lift an instance double outside an `it` statement I received errors.

As a priority learning objective I would like to understand this better, as I am sure there will be a way to implement this in a DRY fashion.

*Note: there are some comments in `plane_spec.rb` that point to where I was having this problem.*

Usage
-----

The project contains a .pryrc file that will require the relevant files, create five instances of `Plane` and three instances of `Airport` for easier feature testing.

Where `plane` is an instance of `Plane` and `airport` is an instance of `Airport`, the following commands can be used:
- `plane.land(airport)` (instruct plane to land at airport)
- `plane.take_off(airport)` (instruct plane to take off from airport)
- `plane.airborne` (see if plane is airborne)
- `airport.capacity` (see airport capacity)
- `airport.planes` (see planes docked at airport)
- `airport.full?` (see if airport is full)
- `Weather.sunny?` (see randomly generated weather - true is sunny, false is stormy)

Here is an example pry session showing program usage:

```
17:32:04  rickclark@Ricks-MBP  ~/Doc…nts/Makers/airport_challenge   master ●  pry                                                  2.2.3
You have 5 planes: plane_1, plane_2, plane_3, plane_4, plane_5
and 3 airports: paris (capacity 3), london (capacity 1), frankfurt (capacity 3)
[1] pry(main)> plane_1.land(london)
=> "Plane has landed in sunny weather at London"
[2] pry(main)> london.full?
=> true
[3] pry(main)> london.planes
=> [#<Plane:0x007fefedc9d698 @airborne=false>]
[4] pry(main)> london.capacity
=> 1
[5] pry(main)> plane_2.land(london)
RuntimeError: Cannot land - airport is full!
from /Users/rickclark/Documents/Makers/airport_challenge/lib/plane.rb:11:in `land'
[6] pry(main)> plane_1.take_off(london)
=> "Plane has taken off from London"
[7] pry(main)> plane_2.land(frankfurt)
RuntimeError: Cannot land - weather is stormy!
from /Users/rickclark/Documents/Makers/airport_challenge/lib/plane.rb:10:in `land'
[8] pry(main)> plane_2.land(frankfurt)
=> "Plane has landed in sunny weather at Frankfurt"
[9] pry(main)> plane_3.land(frankfurt)
RuntimeError: Cannot land - weather is stormy!
from /Users/rickclark/Documents/Makers/airport_challenge/lib/plane.rb:10:in `land'
[10] pry(main)> plane_3.land(frankfurt)
=> "Plane has landed in sunny weather at Frankfurt"
[11] pry(main)> plane_4.land(frankfurt)
RuntimeError: Cannot land - weather is stormy!
from /Users/rickclark/Documents/Makers/airport_challenge/lib/plane.rb:10:in `land'
[12] pry(main)> plane_4.land(frankfurt)
=> "Plane has landed in sunny weather at Frankfurt"
[13] pry(main)> plane_4.take_off(london)
RuntimeError: Cannot take off - am not landed at London!
from /Users/rickclark/Documents/Makers/airport_challenge/lib/plane.rb:18:in `take_off'
[14] pry(main)> plane_4.take_off(frankfurt)
=> "Plane has taken off from Frankfurt"
```
