Airport Challenge - Helen's Notes when walking through the user stories
 
User story 1

As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
 
1. Create Class for Airport and for Plane
2. Define initialise method and landing_plane method(plane)
3. Define airport as an array: Airport = []
4. Attr_reader :airport_store for airport array so it can be accessed anywhere within the airport class

 
User story 2

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
 
1. Define take_off method
2. If a plane has taken off, remove plane from airport_store by using syntax .pop
3. Check the length is one less, and return “Plane has taken off from the airport”


User story 3

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 
 
1. Create Class for weather
2. Define state_of_weather method
3. Create a random_number variable assigned to the rand() syntax, and associate each number with either sunny or stormy. 3. Assign 4 numbers to sunny and 2 to stormy, as the stormy weather condition is less frequent
4. weather = instance_double("Weather", :state_of_weather => "sunny") -> Insert an instance_double to ‘Mock’ the weather. In this instance we require the weather to be sunny in order for a plane to land at the airport
5. I had the issue of setting the instance_double as stomy for this test, however this mean't that a plane never landed, therefore there was no plane to take off. In order to fix this, in the test I moved the instance_double to AFTER the plane has landed, so there was a plane stored in the airport_store
 
Notes on instance_double: A test double is an object that stands in for another object - The double method passes in an optional identifier


 
User story 4

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
 
1. Use weather class to determine in the user test to define the weather is stormy.
2. Prevent the plane from landing, so check to see if the airport includes the plane. If false, then plane has not landed
3. If plane is sunny, push plane into airport, else don’t push
 

 
User story 5

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
 
1. Assign airport capacity to a number (3)
2. If the airport is array is 3 or greater, full is true
3. Define the default capacity outside of the methods
4. In the unit test, call the DEFAUL_CAPACITY from the Airport Class using syntax ‘Airport.new::DEFAULT_CAPACITY’.times for the plane landing, to determine when the airport is full
 
User story 6

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
 
1. Parameter ‘capacity’ added to initialise method, allowing a default
2. Define the default capacity outside of the methods
