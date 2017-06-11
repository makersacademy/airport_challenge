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

Approach to solving the challenge
---------------------------------
First, I created a domain model for each User Story so I could keep track of the specified criteria.

My program ensures that:
* it can land a plane at an airport
* it can get a plane to take off from an airport
* it prevents take off and landing when the weather is stormy
* the capacity of an airport can be overridden
* it prevents landing when the airport is full
* it prevents take off when there are no planes
* it can confirm the statuses of the planes
* a plane that has landed cannot land again without take off
* a plane that has taken off cannot take off again without landing


Landing a plane
---------------
This is where my program started. I made several test cases for landing a plane at an airport. First describing what I wanted to test and then running it through RSPEC and expecting errors to occur.

```ruby
describe Airport do
  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
  end
end
```
I expected the errors to show that I didn't have an 'Airport' class or a 'land' method, and then proceeded to write the code for the tests to pass.

```ruby
class Airport
  def land(plane)

  end
end
```
I then proceeded to write tests to actually land a plane at the airport and the supporting code for that.


Taking off a plane
------------------
I made the test cases for taking off a plane in much the same way as landing the plane (as above).


Preventing landing/take off during stormy weather
-------------------------------------------------
* For the weather tests, I created a an array which contained 'sunny' and 'stormy' that was randomised using the '.sample' method.
* I incorporated a stub for the weather so that it wouldn't randomise when trying to run the tests using RSPEC and irb
* My program raised an error if a plane tried to land/take off in stormy weather.


Overriding the capacity of an airport
-------------------------------------
* I set a default capacity of 20 as a variable in my Airport class to test against this criteria.

* I used it to test the next criteria (airport is full) and set it as an argument in the initialize method to allow the capacity to be overridden.


Preventing landing when the airport is full
-------------------------------------------
I made sure that the weather was set to 'sunny' to run my tests

* In my spec, I landed the default capacity of planes at the airport
* Tried landing another plane
* My program raised an error to say that my airport was full if the plane count at the airport was equal or more than the default capacity


Preventing take off when the airport is empty
---------------------------------------------
Again, the weather was set to 'sunny' to run my tests

* I wrote a test to take off a plane that wasn't in the airport
* My program raised an error to say that my airport was empty if there were no planes at the airport


Plane statuses
--------------
* Created and ran tests for when the plane is airborne and on land with messages to confirm the statuses
* Created methods in the 'Plane' class to set the airborne statuses


Landed planes not landing again, airborne planes not taking off again
---------------------------------------------------------------------
Again, the weather was set to 'sunny' to run my tests

* Created tests for landing a landed plane first: landed a new plane, and then tried to land that plane again, expecting it to throw an error
* My program raised an error if the plane was already on land
* Created tests for taking off a plane that already took off: landed 2 planes in the airport to begin, took off one and tried to take off the same one, expecting an error to be thrown
* My program raised an error if the plane was already airborne
* Incorporated the status of the planes when they take off and land with the associated messages from the 'Status' method in the 'Plane' class
