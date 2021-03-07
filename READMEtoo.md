# Air Traffic Controller

## Commands for AirTraffic class

- `AirTraffic.interrogate(plane)` this requests the location of the specified plane.

- `AirTraffic.land(plane, airport)` this commands a plane to land at a specified airport and returns two things; the location output `String` and returns the `in_flight` variable, which should be `false`.

- `AirTraffic.takeoff(plane, destination_airport)` this commands a plane to take off and sets the destination of that plane to the specified airport, the airport arguement can be left blank and the plane will keep any previously assigned destination (ie. from creation). 

## Quick explanation of Plane class

- Initialized with an origin and destination variables which are expected to be of the `Airport` class and if no arguements are passed it creates new instances of `Airport`.
- Initialized with a variable `in_flight` which is init to `false` - new planes don't appear in the sky!
- Init with a variable `callsign` which if created without being passed an arguement is taken simply from the object instance Id.
- `location` returns the `code` of the airport it is in if not in flight, otherwise returns a string with information about its destination.
- `takeoff` protects the plane from being called to take off when already in flight, and if the weather is unsuitable. Returns `true` if successful as it updates the `in_flight` variable to true. It also removes it's self from the `gates` of the airport class instance it took off from.
- `land` protects the plane from being called to land if not in flight and prevents landing if the weather is not suitable. Appends the plane to the `gates` of its destination airport and returns `false` as it sets the `in_flight` variable to `false`.

## Quick explanation of Airport class

- Initialized with the variable `capaicty` which also has a default if no arguement is passed.
- Initialized with an array `gates` which contains any planes that are landed at the airport.
- Initialized with a variable `code` which is the 3 character code that all airports in the world have, if no method is passed the code is defauled to the instance id of the object.
- `safe_to_land?` returns `true` if it is safe for a plane to land at the airport, it checks whether the airport is at capacity and also if the weather is suitable.
- `safe_to_takeoff?` returns `true` if the weather is suitable for a plane to take off.
- `local_weather` uses rand to determine the outcome of the local weather and returns either `:stormy` or `:clear` at one in six in favour of `:clear`.

## IRB help 

- `irb_helper.rb` gives you some pre instantised `Airports` and `Planes` to demo the system with. I had to make them `global` variables for irb to recognise them.

1. Start by entering: `require './lib/irb_helper.rb'`
2. Create an air traffic controller: `tower = AirTraffic.new`
3. Lets get some planes off the ground: `tower.takeoff($za915)` `tower.takeoff($za943)` `tower.takeoff($zj754)` `tower.takeoff($xj652)` 
4. You might have noticed that you couldn't command all of the planes to take off, the weather was probably bad, but if you persist, it will break to get those holiday makers away! You also might have been lucky and had clear skies all around.
5. Lets see if your luck continues, `three` of our planes are headed to `XJA`, but that particular `Airport` has a capacity of `two`, super exclusive. Lets see what happens: `tower.land($za943, $xja)` `tower.land($zj754, $xja)` `tower.land($xj652, $xja)`