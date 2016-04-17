# Airport Challenge
Makers Academy Week 1 Weekend Challenge
We had to implement the following user stories using TDD.

> As an air traffic controller
> So I can get passengers to a destination
> I want to instruct a plane to land at an airport and confirm that it has landed

> As an air traffic controller
> So I can get passengers on the way to their destination
> I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

> As an air traffic controller
> To ensure safety
> I want to prevent takeoff when weather is stormy

> As an air traffic controller
> To ensure safety
> I want to prevent landing when weather is stormy

> As an air traffic controller
> To ensure safety
> I want to prevent landing when the airport is full

> As the system designer
> So that the software can be used for many different airports
> I would like a default airport capacity that can be overridden as appropriate

## Classes:
### Plane
- The only property of planes we care about in this model is whether they are at an airport or not.
- In this model, planes have a `@flying` property to denote this.
- Conceptually, if they are not flying, then they are at an airport.
- `#initialize` sets `@flying = true`
- Planes can use `#flying?` to report their flying status.
- Planes can use `#land` to set `@flying = false`
- Planes can use `#take_off` to set `@flying = true`

### Airport
- Airports are responsible for storing and releasing planes.
- The class includes `Weather`
- Planes are stored in the `@planes` instance variable.
- Airports have a default capacity of 1
- `#accept` evaluates whether a plane can land. If so, it tell the plane to land and adds the plane to `@planes`
- Planes are only told to land if they are flying (aka. not at an airport), if the weather is not stormy, and if the airport is not full.
- `#release` evaluates whether a plane can take off. If so, it tells the plane to take off and removes them from `@planes`
- Planes are only told to take off if they are at the airport (aka. `@planes` includes the plane) and the weather is not stormy

## Modules:
### Weather
- Weather enables it's host class to check if it is stormy. It contains one method - `#stormy?`, which has a 10% chance of returning true
