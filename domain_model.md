
#### User Story One
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
**plane** **land** **airport**
*done*

#### User Story Two
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
**plane** **takeoff** **airport**
*done*
*need ability to store planes based on above user story, this allows system to check if plane is no longer there*

#### User Story Three
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
**takeoff** **weather** **stormy**
*implement condition based on weather, use weighted randomness (80% sunny/20% stormy). Getting a random number between 1 and 10 inclusive, if 9 or 10 then stormy, else fine weather.*

#### User Story Four
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
**takeoff** **weather** **stormy**

#### User Story Five
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
**airport** **land** **full?**

#### User Story Six
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
**airport** **capacity** **DEFAULT_CAPACITY**
