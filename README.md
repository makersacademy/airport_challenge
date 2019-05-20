Airport Challenge
=================

```
                  __   _              __   _ 
                _(  )_( )_          _(  )_( )_
               (_   _    _)        (_   _    _)
              / /(_) (__)         / /(_) (__) 
             / / / / / /         / / / / / /
            / / / / / /         / / / / / /

        ______                          
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

Info
---------
For original readme with challenge instructions, see https://github.com/makersacademy/airport_challenge

My approach to the challenge
---------
* TDD approach using rspec unit tests (see below)

* Tried to consider the responsibilities of each class:
  * Plane class decides when to land or take off

  * Before doing so, first asks the airport if it's OK
  * Airport checks the weather class (an instance is provided when airport is initialised) and uses this, and its capacity, to let the plane know whether it's OK to land or take off  
  * If the plane tries to take off or land anyway in stormy weather, that's its problem
  * If the plane tries to land but there's no capacity, everything explodes and there's an error
  * Both of the above are theoretical as won't actually happen in the general use of the program - the plane won't take off or land if it's not supposed to

* Met all requirements with 100% unit test coverage


My testing approach
---------
* Unit tested following Red - Green - Refactor
* Began with creating domain model for user stories - see https://github.com/peterjcole/airport_challenge/blob/master/user_stores.md
* Moved on to writing basic manual feature test for a small feature
* Then following the Red - Green - Refactor with rspec unit tests for that feature
* Implemented each feature one class at a time
* Then moved on to next feature
* Wrote rspec feature test once implementation of all user stories was complete: https://github.com/peterjcole/airport_challenge/blob/master/spec/feature/airport_planes_weather_spec.rb
* Isolated the plane class in the airport unit tests, and vice versa, using mocks and stubs

* Isolated the weather class - used srand() for the unit tests of the class itself, using stubs




