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
For original readme, see https://github.com/makersacademy/airport_challenge

My testing approach
---------
* Unit tested following Red - Green - Refactor
* Began with creating domain model for user stories - see https://github.com/peterjcole/airport_challenge/blob/master/user_stores.md
* Moved on to writing basic manual feature test for a small feature
* Then following the Red - Green - Refactor with rspec unit tests
* Implemented each feature one class at a time
* Wrote rspec feature test once implementation of all user stories was complete: https://github.com/peterjcole/airport_challenge/blob/master/spec/feature/airport_planes_weather_spec.rb
* Isolated the plane class in the airport unit tests and vice versa, using mocks and stubs
* Isolated the weather class - used srand for the unit tests of the class itself, using stubs

My approach to the challenge
---------
* Tried to think about the responsibility of each class a bit before but also as I was going along and implementing more functionality
* Plane class decides when to land or take off, but first asks the airport if it's OK (land and take_off methods which take airport as argument)
* Airport checks the weather class (an instance needs to be provided when airport is initialised) and uses this, and its capacity, to let the plane know whether it's OK to land or take off
* If the plane tries to take off or land anyway in stormy weather, that's its problem
* If the plane tries to land but there's no capacity, everything explodes and there's an error
* Both of the above are theoretical as won't actually happen in the general use of the program - the plane won't take off or land if it's not supposed to
* Met all requirements with 100% unit test coverage


