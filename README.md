 ## AIRPORT CHALLENGE ##

 This is a test-drive of a system to control the flow of aircraft at an airport:

 - Aircraft can land at an airport and take-off from the airport
 - Airports check the weather to ensure it is safe for take-off and landing of planes
 - Airports have a fixed capacity for planes that can be set on initialization (defaults to 50)
 - Planes will communicate with airports and only take-off or land with permission from the airport control

 ### Classes: ###
 #### Airport ####

 Main methods are:
 - .land (plane) : Allows a plane to land at the airport
 - .release_for_takeoff (plane) : Allows a plane to take off

 Other public methods:
 - .expecting? (plane) : returns whether the airport is expecting the plane to land
 - .released_for_takeoff? (plane) : returns whether the airport is expecting the plane to take off
 - .weather= : Allows the user to set the weather
 - .planes : Allows the user to see which planes are in the airport
 - .capacity : Allows the user to see the capacity

 #### Plane ####

 Main methods are:
 - .land (airport) : Orders the plane to land at an airport
 - .take_off : Orders the plane to get into the sky

 Other public methods:
 - .location : Allows the user to see the location of the plane

 #### Weather ####

 Method:
 - .conditions : Returns randomized weather. Sunny mostly, Stormy 1/10th of the time.


 ### Example Usage: ###
 run feature_test_examples.rb 
 (note this may raise errors when the weather decides to be stormy)  