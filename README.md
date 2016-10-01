My approach to solve the problem:
I made a diagram on paper for each of the user stories, from what I set what class, module and method will need to be created.
Using TDD (creating spec files for each ruby file created):
  I created a file plane.rb containing the class Plane

  I created a file airport.rb containing the class Airport in which I created all the method needed for plane landing and taking off.
  In those I added the conditions necessary to satisfy all the user stories and edge cases. Including the stormy module to define if the weather is good enough for the planes to land and take off
  I set up the airport capacity (default to 50 but changeable for each instance of Airport)

  CI test report:
  
  https://travis-ci.org/makersacademy/airport_challenge.svg?branch=master
