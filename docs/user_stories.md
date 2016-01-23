As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport and confirm that it has landed 

	* Classes required: Plane, Airport
	* Actions required: Plane.land(airport)

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

       * Classes required: Plane, Airport
       * Actions required: Plane.takeoff

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy

       * Classes required: Plane, Weather
       * Actions required: Modify Plane.takeoff, Weather.sunny?
 
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 

       * Classes required: Plane, Weather
       * Actions required: Modify Plane.land(airport), Weather.sunny?

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full
       
	* Classes required: Plane, Airport
	* Actions required: Modify Plane.land(airport), modify class Airport with @capacity

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

        * Classes required: Airport
        * Actions required: Modify @capacity for class Airport to allow customization



