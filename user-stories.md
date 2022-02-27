We need to break down the user stories provided into objects and messages, display these in a table. These tables will serve as our Domain Models.



##### User Story 1
```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```

| Objects | Messages | Additional Notes |
| --- | --- |
| plane | land | Plane object is the most appropriate one to handle landing and taking off |
| airport |  | Airport object should know what Plane objects are in it |

