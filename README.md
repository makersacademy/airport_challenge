Classes:
-Plane
The only property of planes we care about in this model is whether they are at an airport or not.
In this model, planes have a `@flying` property to denote this.
Conceptually, if they are not flying, then they are at an airport.
Planes can use `#flying?` to report their flying status.
Planes can use `land` to set `@flying = false`

-Airport
Airports are responsible for storing planes.
Airports can use `#accept` to evaluate whether planes can land. If so, it tell planes to land and stores planes that have landed
Airports can use `#planes` to report the planes that they contain.
