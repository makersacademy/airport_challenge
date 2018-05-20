As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

Objects        |  Messages          |  Result  
Airport           land(plane)          message saying that the plane has landed 

Airport <--- land(plane) ---> message saying plane has landed 

- can tell plane to land 
- can store plane in hangar 
- can return a message saying plane has landed


As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport


Objects        |  Messages            |  Result  
Airport           take_off               message saying that plane has taken off 
Airport           check_plane(plane)     message saying that plane is not in airport              

take_off(plane)
- Airport should be able to respond to take_off
- Airport should be able to release a plane from it's hangar 
- Airport should send message to user to confirm that plane has taken off (do I want this?????)
- Airport should not have the released plane in its hangar after take off
- Airport should have 1 less plane in hangar after successful takeoff 
- Airport should kick a 'no planes available error' if no planes are in hangar

check_plane(plane)
- Airport should be able to check if a specific plane is in its hangar 



As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

* If 'weather' is 'stormy'

Objects        |  Messages            |  Result  
Airport           take_off               message saying that runway is closed 

is weather the state of the instance of Airport Class? 
OR 
is weather it's own class (i.e. weather is class, 'todays weather' is instance of class)


As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 

* If 'weather' is 'stormy'

Objects        |  Messages            |  Result  
Airport           land(plane)            message saying that runway is closed 


As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

* If 'capacity' is at maximum 

Objects        |  Messages            |  Result  
Airport           full?                  true 
Airport           land(plane)            message saying that landing is prevented


As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

Objects        |  Messages                |  Result  
Airport           initialize(capacity)       message saying that the airport capacity has been changed 



Edge cases 

- Planes can only takeoff from airports that they are in 


Object          |   Message                    |      Return 
Airport             take_off(specific_plane)      This plane is not in this airport 


- Planes that are already flying cannot take off and/or be in an airport

Objects         | Message                       | Return 
Plane             flying?                         true
Airport           take_off(plane)                 Error message "This plane is already flying" 
Airport           check_plane(plane)              false                 


- Planes that are landed cannot land again

Objects         | Messages                      | Return 
Plane             flying?                         false
Airport           land(plane)                     error msg "Plane is already landed" 



- Planes that are landed must be in an airport 

Objects         | Messages                       | Result 
Plane             flying?                          false
Plane             in_airport?                      true 

