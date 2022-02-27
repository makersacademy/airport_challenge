We need to break down the user stories provided into objects and messages, display these in a table. These tables will serve as our Domain Models.



##### User Story 1
```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```

| Objects | Messages | Additional Notes |
| --- | --- |
| plane |  | Plane object will represent the plane |
| airport | land | Airport object should know what Plane objects are in it, and can handle landing and take offs for plane objects |

