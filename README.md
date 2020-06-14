**Airport Challenge**

*Brief Explanation*
My thinking for this challenge was that I would first create a class called 'Airport' and a class called 'Plane', so that these two objects can interact with each other.

The first step was to get a plane to land at an airport, so I created a method '#land' for the plane, which takes the airport as an argument and docks the plane there. The first thing the method does is check to see if the plane is already landed, and returns an error message if so. The land method tries to call the '#dock(plane)' method in the instance of airport, which will send an error message back if the airport is full, the weather is stormy, or the plane is alredy docked there.

For the next step I created '#takeoff' for the plane to ensure that it can leave the airport and that it deletes itself from the dock. The takeoff method also checks to see if the plane is already airborne, in which case it will return an error.

The next method was to ensure that the airport can be created with a default capacity, so I made the Airport class instantiate with a default capacity of 1.

For the weather, I created another class called Weather, which is instantiated within airport whenever it is created. Weather.stormy? has a 1 in 10 chance of returning 'true', so the airport can check on the weather before telling a plane whether it can land or not.

*Some problems*
I had some problems testing this - it seems that I'm only at 80% test covereage for the weather file. I think I need to make sure that the method will sometimes return 'true' rather than just testing whether it returns 'true' or 'false'. I will try to figure that out!

I am also at not full test covereage for airport.rb. The problem is how I am testing for what 'weather' is returning.

I am using this to ensure that the airport.weather_is_stormy? method returns a true or false depending on what conditions I am testing for.
  allow(subject).to receive(:weather_is_stormy?) { false }

I can sometimes get to 100% test covereage if I use 'let' to refer to the instance of weather created within airport, and then tell that method to return true or false, rather than the 'airport.weather_is_stormy?' method.
  let(:weather) { airport.weather }
  ...
  allow(weather).to receive(:is_stormy?) { false }

However, my tests do not always pass if I do this, which tells me that the tests are not telling 'weather.stormy?' what to return properly.



Rubocop also told me that tyhe conditional expression 'if @weather.stormy? == true' could be replaced by '@weather.stormy? == true'. I'm unsure what that means as that would break my if statement.






