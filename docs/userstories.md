As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

air traffic controller: instruct plane to land
plane: land


As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

air traffic controller: instruct plane to take off
                        confirm departed airport
plane: take off


As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full

air traffic controller: prevent landing if airport full
airport: to have a capacity


As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

system designer: override airport capacity
airport: to have a capacity


As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

air traffic controller: prevent takeoff if stormy
weather: be stormy


As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy

air traffic controller: prevent landing if stormy
weather: stormy



nouns as possible objects/classes
verbs as possible messages/behaviour/methods



air traffic controller: instruct plane to land at airport
                        instruct plane to take off from airport
                        confirm departed airport
                        prevent landing if airport full
                        prevent takeoff if stormy
                        prevent landing if stormy
plane: land
       take off
airport: to have planes land
         to have planes take off
         to have a capacity
system designer: override airport capacity
weather: be stormy
         be sunny
