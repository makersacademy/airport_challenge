This software repliactes an aiport system using Ruby. The main focus of the project has been to use TDD development techniques. 

The project complains 3 classes. A airport class that contains almost all of the functionality, a weather class that allows the weather to be randomly updated, and a empty plane class. 

To use run this code you must clone this repo and run IRB. Once in IRB write commands
require './lib/airport'
require './lib/plane'
require './lib/weather'

Then running airport = Airport.new, weather = Weather.new and plane = Plane.new will make new aiport, weather and plane objects. We can then observe the functionality. 

The functionality is all in the airport object. If we first run airport = Airport.new(2) we will make an airport with a max capacity of 2 planes. A weather instance is created when an airport is initialized. 

We can then initialize a plane object and make it interact with the airport. Runnign plane = Plane.new and then airport.take_off(plane) should raise the error 'Plane is not in hangar'. This is saying a plane cant take off from an airport it is not at. When planes are initialized then can be thought of as starting in the air. Running airport.land_plane(plane) will add a plane to the hangar of the airport. Running airport.hangar will return a list of the plane objects in the hanger. 

If we try adding the same plane again with airport.land_plane(plane) we will get the error 'Plane is already in hangar'. Therefor to test further functionality we can create more plane instances and try adding them to the airport. When attempting the land a plane at an airport at max capacity we will see the error 'Airport is full'. 

Now we have an airport with 2 planes in the hangar we can test the take_off functionality. Running airport.take_off(plane) will cause the plane object to leave the airport. If this is run with a plane that is not in the hangar we will ge the error 'plane is not in hangar'. If the plane in in the hangar and is passed into the take_off function the plane will be deleted from the hangar list. 

Anytime take_off or land_plane methods are run the weather is randomised using the function weather.update_weather. This gives a 1 in 10 chance of the weather being stormy. If the weather is stormy and take_off or land_plane are run then no action will be taken and you will get the error message 'It is too stormy'. 

Problems - 

Code appears to be running fine but I have messed up with the tests after chaning some functionality. Right now any weather tests in airport spec (testing if the planes will take off / land in stormy weather) will fail often. I think this is a problem in the tests rather than the code. Because weather.update_weather is called in both take_off and land_plane I struggled to make sure I had the correct weather setting for testing. I have experimented with instance_variable_set but havent managed to make it work yet. In order to manually test this right now you can move the update_weather call to the last line of take_off and land_plane. This will allow instance_variable_set to change the weather to be what we want for testing. 


