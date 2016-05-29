README::::airport_challenge

Author:::: Michael Lo, Makers May cohort 2016

Files

lib
- airport.rb    : airport class and methods
- plane.rb      : plane class and methods
- weather.rb    : weather class and methods

spec            : respective tests
- airport_spec.rb
- plane_spec.rb
- weather_spec.rb
- feature_spec.rb

::Approach

When writing the classes for the task I sorted the user stories into objects and actions. I then a imagined how I wanted my interface to look and wrote an rspec test. I ran rspec and corrected all errors until green.

Below are some further notes of what I spent most time questioning for each step. They double as areas I need to better understand  and as actionable points for if I were to work more on the project.  

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed

# keywords: plane(land) at airport(confirm)
# questioning if plane or airport should check if landed. Chose airport as a reflection of real life.

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

# keywords: plane(take_off) airport(confirm)
# questioned, am I supposed to have passengers? Decided against due to absence of actions(verbs) for passengers(object)

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

# keywords: prevent take_off when stormy
# questioned if plane or airport should prevent takeoff. Chose Airport as a reflection of real life.
# first draft of method after rspec tests:
# def check_weather
#   raise 'No planes can take off in a storm' if Weather.new.stormy?
# end
#- later changed to a format that made more 'sense' i.e. asking 'airport please create the weather' didn't seem like a sensible #request. Still would like to know how to test with rspec.
# also questioned naming practices -- def check(weather) or def check_weather(weather) better? chose check_weather(weather) due to readability of method when considering parameter name could be anyhting i.e. check(car).

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

# keywords: prevent landing weather stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

# keywords: prevent landing airport full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

# questioning if I should have made more methods private and asking, what are the implications of private methods on rspec tests.
# should implement 'context' for weather
# created a feature test - was unsure if it should include 'tests' or should just have no 'expects' and display like irb
# during the creation of feature test, found a bug. there is no error returned if trying to take_off a plane twice, even though the plane is no longer in the array. Decided that according to user stories this would be correct, as my method airport.check_for_landed(plane) fufills the first user statement 'confirm that it has landed'. However, decided it is not in the spirit of the program to keep track of airplanes and accurately allocate them to destinations. It doesn't make sense to have a plane 'take_off' twice from the same location. fixed it by writing new tests and methods (check_if_already_landed) and (check_if_already_flying).
# need more research for how best to make methods private to increase program security.
```
