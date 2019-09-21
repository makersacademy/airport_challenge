# Airport Challenge
#Makers/week1 #Makers/Weekend_Challenge


The challenge this weekend was to create a program that simulates an Airport. Planes would be coming (landing) and going (taking off) from the Airport. Weather also plays a part as an Airport will only allow a Plane to take off or land if the conditions are right ie Sunny. Sometimes the Weather will be stormy and so the Airport will instruct planes that they cannot take off. 

_**User Story’s**_
- - - -
_As an air traffic controller_ 
_So I can get passengers to a destination_ 
_I want to instruct a plane to land at an airport_

_As an air traffic controller_ 
_So I can get passengers on the way to their destination_ 
_I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport_

**Domain Model for Above**
- - - -

Airport                 		| Collaborators
————————————————-	|—————————
Can receive planes      | Plane, Airport
Can release planes      | Plane, Airport
Can count planes		|

Plane                 		| Collaborators
————————————————-	|—————————
Can take off		        | Airport
Can land		        | Airport
- - - -
_As an air traffic controller_ 
_To ensure safety_ 
_I want to prevent takeoff when weather is stormy_ 

_As an air traffic controller_ 
_To ensure safety_ 
_I want to prevent landing when weather is stormy_

**Domain Model for Above**
- - - -
Weather                		| Collaborators
————————————————-	|—————————
Can be sunny	        | Airport
Can be Stormy 		| Airport
- - - -

_As an air traffic controller_ 
_To ensure safety_ 
_I want to prevent landing when the airport is full_ 

_As the system designer_
_So that the software can be used for many different airports_
_I would like a default airport capacity that can be overridden as appropriate_

**Domain Model for Above**
- - - -

Airport                 		
————————————————-	
Has a Default Capacity     
Knows when capacity is full
Capacity can be changed
