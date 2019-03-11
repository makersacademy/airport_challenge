# Airport Challenge

## Instructions

In root folder execute `irb -r ./lib/airport.rb -r ./lib/weather_station.rb -r ./lib/plane.rb`.

```
> weather_station = WeatherStation.new
 => #<WeatherStation...>
> airport = Airport.new(weather_station)
 => #<Airport...>
> plane = Plane.new
 => #<Plane...>
> airport.land plane
☀️ Plane landed! ☀️
 => #<Airport...>
> airport.clear_for_takeoff plane
☀️ Up, up and away! ☀️
 => #<Airport...>
# or if you're unlucky:
 => RuntimeError (⛈ Sorry, all aircraft grounded until further notice. ⛈)
```

## My method

I started by taking each user story one by one. First I converted it into a feature test (see them [here](notes.md)), then I wrote a test, then the code to pass that test, refactoring if necessary (RED, GREEN, REFACTOR). I repeated this until the feature was implemented, before moving onto the next user story.

I tried to `git commit` after every stage of the RED, GREEN, REFACTOR cycle. This is a bit over the top for normal practice, but was to show my process for this exercise.

After implementing the features from the user stories I remembered about RSpec `context` blocks and spent a while refactoring all my tests...

After that I started writing user stories for the edge cases, and using the same process to implement them. I ran out of time before finishing all of the edge cases, but here's how I would have continued:

### Outstanding edge cases

- Planes that are flying cannot take off / planes that are not flying cannot land
  - I've implemented `land`, `take_off` and `.flying?` methods on the `Plane` object, including errors if you try and land a plane that's not flying or take_off a plane that it flying
  - But need to make the airport's `land` and `clear_for_takeoff` methods to use these methods
- Planes that are flying must not be in an airport
  - Um... similar to the above but the method on `Plane` which changes a plane's `flying` status to `true` should raise an error if the plane is in an airport? Or something?
- Planes that are not flying must be in an airport
  - As above but... vice versa

## Code quality

Here are some areas I was aware of before reading the code quality rubric, and might have done differently if I was starting again now:

- The tests for `.clear_for_takeoff` depend on `.land`. Would probably be better to  make these independent by... stubbing `airport.planes` or something?
- When testing capacity, would it be better for the tests to simulate adding loads of planes to an airport somehow, rather than running `airport.land` over and over again? By stubbing or something? Maybe this is OK though...
- We've got three possible errors at the start of the `.land` method. Should we write tests to make sure they come in the correct priority? e.g. at the moment if the weather is bad and the airport is also at capacity, the 'bad weather' error will fire. do we need to test that the 'airport full' error doesn't fire in that situation?

Having read the rubric now though, there are several more things I'm aware of!