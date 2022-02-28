We need to break down the user stories provided into objects and messages, display these in a table. These tables will serve as our Domain Models.



##### User Story 1
```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```

| Objects | Messages | Additional Notes |
| --- | --- | --- |
| plane |  | Plane object will represent the plane |
| airport | land | Airport object should know what Plane objects are in it, and can handle landing and take offs for plane objects |


##### User Story 2
```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

| Objects | Messages | Additional Notes |
| --- | --- | --- |
| airport | take_off | should output a plane, and also need to confirm if plane has left the airport |


##### User Story 3
```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full
```

| Objects | Messages | Additional Notes |
| --- | --- | --- |
| airport | land_plane | should raise an error when Hangar is full (lets set a maximum capacity of 10 Planes) |


##### User Story 4
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

| Objects | Messages | Additional Notes |
| --- | --- | --- |
| airport | initialize | Add an argument that can be provided to set the max capacity, also have a default value incase no argument is given |