# Makers Academy Airport Challenge
### Weekend challenge, week 1

Building on OOP work carried out throughout the week, this challenge required those taking it to translate a series of user stories into code. The challenge was based around creating airport and plane objects, the latter of which would be able to take off and land, and the former of which would have capacities to accept certain numbers of planes, as well as not permitting planes to take off or land during a storm.   

This task built on similar work we had done throughout the week, designing a system of bikes, docking stations, vans, and repair shops to mirror London's Boris Bikes system. The full instructions for the airport challenge can be found in [instructions.md](https://github.com/peterwdj/airport_challenge/blob/master/instructions.md).


### Approach
I used a test-driven approach to put together this system - an approach strongly advocated by Makers. A lot of my work on this project mirrored my work on the Boris Bikes project, with airports created as objects that could hold and release plane objects stored in an array, assigned to an instance variable of an airport. To solve the issue of storms, I used Ruby's `rand` method as a way to randomly decide whether or not there would be a storm on any given instance of a method being called - and then escaped the method with a `fail` clause if necessary. The airport's capacity was stored in an instance variable, accessible to other classes via an attribute reader.
