<h1> README: Airport Challenge </h1>

<h2> Initial thoughts: </h2>

- After reading the user stories I identified that three classes were needed: Airport, Plane and Weather

<h2> Airport: </h2>

- When an airport lands(#land) a plane it is added to its contents(@contents)
- When an airport takes off(#take_off) a plane it is no longer in its contents, it confirms that the take off was completed successfully ("Take off complete")
- If weather is identified as stormy it will not land a plane or allow it to take off, instead it will raise corresponding error messages ("Weather preventing landing" and "Weather preventing take_off")
- It has a default capacity(@capacity) which can be overridden
- It can check if it is full(#full?) and does not allow planes to land when this is the case, instead raising an error message ("Airport full")
- It does not allow a plane which is already in the airport to re-land, instead raising an error("Plane already landed)
- It does not allow a plane which is already in the air to re-take off, instead raising an error("Plane already in the sky")

<h2> Plane: </h2>

- It can make planes

<h2> Weather: </h2>

- When an instance is created it is randomly assigned an index(@random_index) which will influence what type of weather
- The options for type of weather are sunny or stormy
- It relays what weather type it is when (#forecast)
- It responds true or false when asked if it is stormy(#stormy?)

<h2> Testing: </h2>

- This program has 100% coverage
- To run tests run `rspec` in the main project directory

<h2> Possible Room for Development: </h2>

- This program does not currently deal with the edge case of what happens when you try and land a plane which is currently not in the airport but is in another airport.
- It is possibly closer to real life practices to have the planes land and take off themselves, with the airport being primarily responsible for knowing if it is at capacity and what planes it contains

<h2> Basic running of the program</h2>

1. create an airport `airport_a = Airport.new`
2. create an plane `plane_a = Plane.new`
3. create the weather `weather = Weather.new`
3. have the airport land the plane, specifying which plane and the current weather `airport.land(plane_a, weather)`
4. have the airport allow the plane to take off, specifying which plane and the current weather `airport.take_off(plane_a, weather)`
5. Add more airports and planes as desired
