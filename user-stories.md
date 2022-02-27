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
