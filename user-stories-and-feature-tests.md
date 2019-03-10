# User stories and feature tests

> As an air traffic controller  
> So I can get passengers to a destination  
> I want to instruct a plane to land at an airport 

```
> airport = Airport.new(WeatherForecaster.new)
 => #<Airport:0x000....>
> plane = Plane.new
 => #<Plane:0x000...>
> airport.land plane
☀️ Plane landed! ☀️
 => #<Airport:0x000...>
> airport.planes.include? plane
 => true
```

---

> As an air traffic controller  
> So I can get passengers on the way to their destination  
> I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

```
# follow above steps to initialise an airport and a plane, and land the plane at the airport
> airport.clear_for_takeoff plane
☀️ Up, up and away! ☀️
 => #<Airport:0x000...>
> airport.planes.include? plane
 => false
```

---

> As an air traffic controller  
> To ensure safety  
> I want to prevent takeoff when weather is stormy  

```
# follow above steps to initialise an airport and a plane, and land the plane at the airport
# then, if the weather is bad...
> airport.clear_for_takeoff plane
⛈ Sorry, all aircraft grounded until further notice. ⛈
 => #<Airport:0x000...>
> airport.planes.include? plane
 => true
```

---

> As an air traffic controller  
> To ensure safety  
> I want to prevent landing when weather is stormy  

```
# follow above steps to initialise an airport and a plane
# then, if the weather is bad...
> airport.land plane
⛈ Sorry, too dangerous to land. ⛈
 => #<Airport:0x000...>
> airport.planes.include? plane
 => false
```

---

> As an air traffic controller  
> To ensure safety  
> I want to prevent landing when the airport is full  

```
> airport = Airport.new(WeatherStation.new)
# with weather.status always being "☀️"...
> 10.times { airport.land Plane.new }
(10 x) "☀️ Plane landed! ☀️"
> plane = Plane.new
> airport.land plane
"Sorry, no more room!"
 => #<Airport: 0x000...>
> airport.planes.include? plane
 => false
```

___

> As the system designer  
> So that the software can be used for many different airports  
> I would like a default airport capacity that can be overridden as appropriate  

```
> airport = Airport.new(WeatherStation.new, 2)
# with weather.status always being "☀️"...
> 2.times { airport.land Plane.new }
(2 x) "☀️ Plane landed! ☀️"
> plane = Plane.new
> airport.land plane
"Sorry, no more room!"
 => #<Airport: 0x000...>
> airport.planes.include? plane
 => false
```

## Edge cases

> As the system designer  
> To, uh... prevent impossible things happening  
> I would like the system to throw an error if take off is requested for a plane which is not at the airport

```
> airport = Airport.new(WeatherStation.new)
 => #<Airport...>
> plane = Plane.new
 => #<Plane...>
> aiport.clear_for_takeoff plane
RuntimeError ("That plane is not at that airport!")
```

## Still to do

### Edge cases

- Planes can only take off form the airport they're in
  - easy to check that `@planes.include? plane` inside `Airport`
- Planes that are flying cannot take off/ planes that are not flying cannot land
  - `Plane` will need a `.flying?` predicate method
- Planes that are flying cannot be in an airport/ planes that are not flying must be in an airport
  - Huh??
  - Maybe... `Plane` has `takeoff` and `land` methods which check whether it's in an airport before modifying the `flying` status, and throws an error if in an inconsistent state? Or that could be in `airport.land` / `airport.clear_for_takeoff`?
- etc.?
  - `airport.lane` will only accept a `Plane` object somehow?
  - Anything else?

### Refactor / code qualiy

- Rubocop says `airport.land` is too long. Can we refactor/shorten? (Can do if we remove some of the confirmation messages, but that seems like a hack)
- Can probably refactor tests using context...
- Read <https://github.com/Hives/airport_challenge/blob/master/docs/review.md> and compare against code
- In particular, need to write a README.md
- Avoid vacuous tests - are any of the tests duplicates/redundant?

### $BONUS

- Write an RSpec [feature test](https://relishapp.com/rspec/rspec-rails/docs/feature-specs/feature-spec) that lands and takes off a number of planes