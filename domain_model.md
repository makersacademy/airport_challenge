Objects  | Messages
------------- | -------------
Air Traffic Controller  |
Plane  | land
Plane  | takeoff
Plane  | confirm_status
Airport | prevent_takeoff if stormy?
Airport | prevent_landing if stormy?
Airport | prevent_landing if full?
Weather | stormy?
System Designer |
Airport | adjust_capacity

#### Diagram of Interactions of Objects via Messages
```
plane   <======== land ========> airport
plane   <======= takeoff ======> airport
plane   <=== confirm_status ===> Air Tr Ctrl
airport <== prevent_landing ===> plane if weather.stormy?
airport <== prevent_takeoff ===> plane if weather.stormy?
airport <== prevent_landing ===> plane if full?
weather <== check_conidition ==> airport
```
