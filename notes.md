# User stories, feature tests, general notes

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
RuntimeError ("⛈ Too dangerous to land. ⛈")
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
RuntimeError ("Airport full")
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
RuntimeError ("Airport full")
> airport.planes.include? plane
 => false
```

## Edge cases

> As the system designer  
> To prevent weirdness  
> I would like the system to raise an error if take off is requested for a plane which is not at the airport

```
> airport = Airport.new(WeatherStation.new)
 => #<Airport...>
> plane = Plane.new
 => #<Plane...>
# whether the weather is good or bad...
> airport.clear_for_takeoff plane
RuntimeError ("That plane is not at that airport!")
```

---

> As the system designer  
> To prevent weirdness  
> I would like the system to raise an error if landing is requested for a plane which is already at an airport

```
> airport = Airport.new(WeatherStation.new)
 => #<Airport...>
> plane = Plane.new
 => #<Plane...>
# with good weather...
> airport.land plane
 => #<Airport...>
> airport.land plane
RuntimeError ("That plane is already on the ground!")
```

## Still to do

### Edge cases

- **DONE** Planes can only take off form the airport they're in
  - easy to check that @planes.include? plane inside Airport
- **DONE** Planes that are landed cannot land again
- Planes that are flying cannot take off/ planes that are not flying cannot land
  - `Plane` will need a `.flying?` predicate method or something?
- Planes that are flying cannot be in an airport/ planes that are not flying must be in an airport
  - Huh??
  - Maybe... `Plane` has `takeoff` and `land` methods which check whether it's in an airport before modifying the `flying` status, and throws an error if in an inconsistent state? Or that could be in `airport.land` / `airport.clear_for_takeoff`?
- etc.?
  - `airport.land` will only accept a `Plane` object somehow?
  - Anything else?
  - airport with zero capacity? negative capacity?

- the tests for `.clear_for_takeoff` depend on `.land`! should make these independent by... stubbing `airport.planes` or something?
- would it be better to directly add loads of planes to an airport somehow, rather than running `airport.land` over and over again? can do `airport.planes << plane`, but that doesn't seem a good idea in case `.plane` is made read-only in the future???
- we've got three possible errors at the start of the land method. should we write tests to make sure they come in the correct priority? e.g. at the moment if the weather is bad and the airport is also at capacity, the 'bad weather' error will fire. do we need to test that the 'airport full' error doesn't fire in that situation?
- `@airport.planes` should br private! 

### Refactor / code qualiy

- Can probably refactor tests using context...
- Read <https://github.com/Hives/airport_challenge/blob/master/docs/review.md> and compare against code
- In particular, need to write a README.md
- Avoid vacuous tests - are any of the tests duplicates/redundant?

### $BONUS

- Write an RSpec [feature test](https://relishapp.com/rspec/rspec-rails/docs/feature-specs/feature-spec) that lands and takes off a number of planes