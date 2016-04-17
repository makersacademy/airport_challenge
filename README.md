# Airport Challenge
Makers Academy Week 1 Weekend Challenge

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
- Planes are stored in the `@planes` instance variable.
- `#accept` evaluates whether a plane can land. If so, it tell the plane to land and adds the plane to `@planes`
- Planes are only told to land if they are flying (aka. not at an airport)
- `#release` evaluates whether a plane can take off. If so, it tells the plane to take off and removes them from `@planes`
- Planes are only told to take off if they are at the airport (aka. `@planes` includes the plane) and the weather is not stormy

## Modules:
### Weather
- Weather enables it's host class to check if it is stormy. It contains one method - `#stormy?`, which has a 10% chance of returning true
