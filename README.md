----- MY README -----

---PROGRAM USAGE---
Weather objects are generated and controlled by the Airport class, and should not be directly accessed.

example_plane = Plane.new
Planes initialize as flying, and have 1 variable - state. This should be either 'Flying' if flying or the @airport_id value of the airport they are stored in, if landed.

example_airport = Airport.new(airport_id, capacity)
Airports initialize with a default name of 'Toby's Airport, and default capacity of 5. They also generate a weather object when created, and set the local weather to randomly generated weather.

example_airport.land_plane(example_plane) - should land a flying plane and change its state, if the weather is sunny, and the airport is not full. 
example_airport.take_off - should takeoff the plane at the end of the @planes array, and change its state, if the weather is sunny, and confirm that the plane has taken off.

examle_airport.regenerate_weather - should rerandomize the weather of the airport, giving confirmations along the way.

---MY APPROACH---
I started this challenge by considering the user stories. I arranged them in an order of increasing complexity, and then broke them down into steps with a rough idea of the tests I would write. 
Step 1 - Feature Test, Unit Test and Implement: Creating a Plane, Creating an Airport, and Storing the Plane in the Airport.
Step 2 - Feature Test, Unit Test and Implement: The Plane leaving the Airport, and sending confirmation.
Step 3 - Here I stopped following the given user stories for a step, and implemented some common-sense / edgecase user stories, such as Planes only taking off from Airports.
Step 4 - I decided to represent weather with a Class, which I think was a mistake in hindsight. I test drove the creation of a basic weather class that returns 'Sunny' 80% of the time, and 'Stormy' 20% of the time.
Step 5 - Here I had technically met the user stories, but my code did not follow SRP, or cover all edgecases, and my tests were not using doubles. This step involved covering the remaining edgecases.
Step 6 - Here I changed my tests to function using doubles, this was easier than I thought it was going to be, in most cases. I struggled a little bit, and ended up unable to cover a line in my Airport.rb with a test.
Step 7 - Finally I refactored my code to follow SRP more closely.
Finishing Steps - Would be good to write an exhausting feature test, and to rework the weather class into a simple 'stormy?' method.
