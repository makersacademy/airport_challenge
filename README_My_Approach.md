## Weekend 1 - Airport Challenge

I started with the first user case, converted it to functional representation as shown below, followed by a diagram showing methods and what the methods will do.

| Object        | Messages                  |
| ------------- |:-------------------------:|
| Controller    |                           |
| Plane         | land                      |
| Airport       | confirm_landing           |                                         

```
Plane <-- Land(airport) --> changes status
Airport <-- confirm_landing(plane) --> adds plane to a list
```
I then broke it down to unit tests :
1. check if Plane class is available
2. check if it responds to land
3. does the land method take one parameter
4. does it change the status when called

Proceeded to follow a similar approach for the other feature tests. Created an Airport and a Weather class. Used a random number generator to model the uncertainty. Took weather, status and location of a plane, along with Airport's capacity to land or take-off a plane.    

## Contributor
- Ashwini Mani

## Bahavior's practised
- [BDD](https://github.com/makersacademy/course/blob/master/pills/bdd_cycle.md)
- [Pair-Programing](https://github.com/makersacademy/course/blob/master/pills/pairing.md)

## Technologies Used
- Rspec
- Ruby
