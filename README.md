#Airport Challenge
Author: Elizabeth Venner

###To run

airport.rb

###Progress report

I got up to the fourth user story ('prevent landing when weather is stormy').

However, tests are failing randomly for third and fourth users stories because I believe I have failed to implement the stubs correctly but I'm not sure where I'm going wrong.

To solve the fifth user story, I intended to create an @planes array in which to store every plane that had landed. I would have defined a capacity as a constant and in the land method would use conditionals to assess whether @planes.count was < 20. If not, an error message 'Airport is full' would be returned but if so, the plane mentioned in the argument would be pushed to this array.

To solve the sixth user story, I intended to make capacity a parameter on initialization but include a default capacity as a second optional argument.
