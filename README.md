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

## My approach

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed
```
```sh  
pry
require './lib/airport.rb'
require './lib/airport.rb'  
plane = Plane.new
airport = Airport.new
airport.land(plane)
plane.landed => true
```
---
```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
```sh
pry
require './lib/airport.rb'
require './lib/airport.rb'  
plane = Plane.new
airport = Airport.new
airport.take_off(plane)
plane.landed => false
```
---
```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```
In order to get a random weather condition, I used a random number generator:

```sh
def good_weather?
  rand(100) >= 20 ? true : false
end
```
and then implemented guard conditions which would prevent take_off or landing:
```sh
raise "No landing when stormy" unless good_weather?
```
and
```sh
raise "No takeoff when stormy" unless good_weather?
```
---
```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```
To check if the airport is full, I gave the airport a capacity and created a private method to check it, then implemented a guard condition to prevent a plane from landing:
```sh
pry
require './lib/airport.rb'
require './lib/airport.rb'  
plane1 = Plane.new
plane2 = Plane.new
plane3 = Plane.new
airport = Airport.new
airport.land(plane1)
airport.land(plane2)
airport.land(plane3) => RuntimeError: No landing when airport is full
```
---
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
```sh
pry
require './lib/airport.rb'
require './lib/airport.rb'
airport2 = Airport.new(4)
plane1 = Plane.new
plane2 = Plane.new
plane3 = Plane.new
plane4 = Plane.new
airport.land(plane1)
airport.land(plane2)
airport.land(plane3)
airport.land(plane4) => RuntimeError: No landing when airport is full
```
### Edge cases

I managed to protect the code only from one edge case, so that landing is not allowed to an already landed plane:
```sh
raise "Plane already landed" if plane.landed
```  

I would have used the same logic for the remaining ones.

### Coverage:

##### 98.90%

#### >>> No offenses detected by Rubocop! <<<
