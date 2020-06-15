**Airport Challenge**

***Brief Explanation***

= First, create a new instance of plane with "plane = Plane.new" and a new instance of airport with "airport = Airport.new".

As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

= To do this, you can instruct the plane to land at the airport with "plane.land(airport)".

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

= To do this, land the plane at the airport, and then run "plane.takeoff". You can check that the plane is no longer in the airport's dock with "airport.docking_bay", which will return an array containing the planes currently there.

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

= To do this, land a plane, then try to land another plane. It should return an error when you try to land the second, as the airports are created with a default capacity of 1.

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

= To do this, create a new instance of airport with "airport = Airport.new(10)" where 10 is the desired capacity.

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

= Reading this back now I realise my code doesn't have this feature - there isn't a check to see if the weather is stormy on takeoff,

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 

= This check happens automatically - there is a 1 in 10 chance of an error happening if you try to land.

***Some problems***

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






