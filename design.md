```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

The SRP splits th classes into Airport, Planes and Weather.
Having a 'weather' method in the Airport or Plane class is low cohesion.
A weather object and an airport object need to interact. Options:
 - The takeoff and landing methods could take weather as a parameter?
  - This would allow me to interact with the weather and the airport to respond to it?
 - An airport object could store a weather object.
  - Does the weather object persist if in two different airports?

After running a test in `spec/check_weather_persistence.rb` I have discovered that when objects are created the variable holds a pointer to that object. So when setting an instance variable of an object (airport) to another object (weather) any changes to that "sub-object" (weather) will be seen across the program.




Structure sketch:
- Airport
  - `.new(weather = Weather.new, cap = default cap)` : will take a weather system and an optional capacity.
  - `.land(Plane)` : will throw error if a storm is a brewing or the airport is full. Should return nil if too stormy, or plane if landed? Otherwise program breaks. Can keep atempting to land until weather clears.
  - `.takeoff(Plane)` : will throw an error if weather is stormy.
  - `.planes` : see which planes are in the airport. To see if plane is still there after takeoff.
  - `.capacity` : see the set capacity.
  - # Extensions for edge cases
  - `.plane_exists(plane)` : private. Checks if the plane has already landed
  - # Extensions for fun.
  - `.build_plane` : Seems strange to have airplanes appear from the sky! Adds a new plane if there's space.

- Weather
  - `stormy?` : Reports the weather. Hard coded change of being stormy.
  - # Extensions for fun and good for testing!
  - `.new(stormy_probability = 0.25)` : Could take the chance of being stormy?

- Plane
  - From the user stories a "Plane" might not even have to exist. However to prevent a plane being in more than one place at once I've added a couple of methods.
  - `.flying?` : To protect against the same plane being landed in different airports only flying planes should be instructed to land.
  - `.land` : To set flying to false
  - `.takeoff` : To set flying to true
  - # Extensions for edge cases.
  - `.new("FlapMcFlappyFace")` : Set a planes name on creation.
  - `.name` : Find the planes name. allow instructing he plane to take off by name. Or can pass the pointer to it.
  - # Maybe extensions?
  - `.airport` : Could also store the airport in the plane? Creates a circular reference. Might be superfluous code. `spec/check_airport_plane_circular.rb` has tested this and a circular reference of objects seems fine in this case. Will attempt to write some tests and see what happens.


---

## Feature tests

