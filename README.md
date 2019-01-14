Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

So what is it?
-------

This is a command line Ruby program, designed with 2 Classes; `Airport` and `Plane`. `Plane` objects are able to take off and land, and `Airport` objects can contain the planes and report on whether it is safe to land/take off, depending on the weather that is randomly set when the airport is created.

Here's an example of its usage:

```
$ irb -r ./lib/plane.rb                      
2.5.0 :001 > airport = Airport.new
 => #<Airport:0x00007f977e9a3810 @capacity=5, @planes=[], @weather="Cloudy">
2.5.0 :002 > plane = Plane.new
 => #<Plane:0x00007f977e99a508 @state="Newly constructed">
2.5.0 :003 > plane.land(airport)
 => "#<Plane:0x00007f977e99a508> has now landed at #<Airport:0x00007f977e9a3810>"
2.5.0 :004 > plane.take_off(airport)
 => "#<Plane:0x00007f977e99a508> has now left #<Airport:0x00007f977e9a3810>"
```

In the above example, you can see a new `Airport` and `Plane` being created, and running simple commands to make the plane object land at the airport, and take off from the airport. 

Within the `land` method of `Plane`, there are 3 error checks;
 1. That the plane is not already at an airport.
 2. That the airport is not full.
 3. That the weather at the airport is safe for landing.
 
Within the `take_off` method of `Plane`, there are 2 error checks;
 1. That the plane is at the airport that it is trying to take off from.
 2. That the weather at the airport is safe for take off.

Setup Instructions
-------

1. Fork this repo, and clone to your local machine.
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`

Task
-----

Below is the task set by Makers Academy:
```
We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

Your task is to test drive the creation of a set of classes/modules to satisfy all the above user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.
```

Approach to solution
-----

My approach throughout the solution was focused around writing manual feature tests first (although after, I learnt how to write feature tests in rspec to avoid repeating myself), then unit tests, followed by the code to solve the tests, and finally refactoring. To keep the README as short and concise as possible, in the explanations below, please assume that all the tests were written prior to the code. I tackled these user stories one by one:

### User Story No.1:
```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```
`Airport` and `Plane` classes were created, with `Plane` having a single function of `land` that takes 1 argument of `(airport)`. At this point, there was no instruction to make any recording of this information, so no further functionality added.

### User Story No.2:
```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
Similarly to User Story No.1, I added a `take_off` method to the `Plane` class that takes 1 argument (the airport to take off from). However, now that we needed to confirm that the plane no longer exists at the airport, this felt like the right time to keep a track of which planes were at the airport. So in the `Airport` class, I added a `@planes` instance variable which is set to an empty array when the airport is initialized. Functionality was added to the `land` method to add the plane to the `@planes` array, and `take_off` method to remove the plane from the `@planes` array.

Since we also needed to confirm to the user that the plane is no longer at the airport, both methods were set to return a friendly message string at the end.

### User Story No.3:
```
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy
```

### User Story No.4:
```
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

### User Story No.5:
```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
```

### User Story No.6:
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

### Edge Cases:
```
Your code should defend against edge cases, such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot takes off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.
```


Future improvements to the code
-----

Unfortunately there was a limited amount of time when designing this solution, so here are a list of improvements that could have been made to the code (and hopefully I'll update this code base at some point to include the changes.

 * Extract the weather from `Airport` into it's own `Weather` class.
 * Change the various weathers from strings to symbols.
 * Make my error message tests shorter, by setting a `msg` variable e.g. `msg = ’Error message to return’` and then call `raise error_message msg`.
 * Get rid of `is_expected.to` tests that redundant (since they are tested within other unit tests).
 * Add further private methods within `Plane` class to make code cleaner (e.g. `airport.planes.include?(self)` should be extracted from the `take_off` method into a private method, such as `exists_in_planes?`.
 * Check that all of my tests are in the right place (i.e. If the end result is to check that another class responds to something, generally it should be moved to the other class’ tests).
 * Remove redundant usage of instance variables (`@state` should be changed to `state` in the `Plane` class)
