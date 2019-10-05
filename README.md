Airport Challenge
=================

## Approach To Problem Solving

1. For each user story I broke down the requirements into objects and methods, producing a table and flow diagram like the one below, for the first user story:

Objects  | Messages
------------- | -------------
air traffic controller  |  
plane  |
airport  | instruct plane to land

airport > instruct plane to land > plane

At this point, following the TDD process I ran a feature test in IRB e.g.

- airport = Airport.new
- plane = Plane.new
- airport.land_plane(plane)

This test would then fail so I would then write a unit test, using the RSpec testing framework. Again, this test would be expected to fail. I would then write code to pass the test in the simplest way possible.

For example creating a class called Plane and one called Airport with the following method:

````ruby
class Airport

  def land
    plane = Plane.new
  end

end
````

Clearly this would not fulfil the requirements of the next user stories, but I stuck to the mantra of tackling each user story in turn and using the simplest code to pass the test before moving on.

For the user requirements to stop planes landing or taking off if the weather was stormy, there was little guidance as to how often weather would be stormy.

Therefore I implemented a random number generator, which would result in an instance of the Weather class to return:
 ````ruby
 weather.stormy? == true
 ````
This was then initialized when the Airport class was instantiated, providing a guide as to whether it was stormy or not.

Overall, I think that I adhered fairly well to TDD principles, and feel that I have met the brief for the user stories. However, it may be possible to increase the complexity of the code, perhaps introducing multiple runways and hangars associated with them, giving the possibility of one area of the airport being full, but not another. As this was not in the user stories, I did not do this, but it could be an area of further development.
