Objects  | Messages
------------- | -------------
Controller |
Plane | land
Airport | instruct_landing

plane <-- land --> true/false
airport <-- instruct_landing --> plane  

Objects  | Messages
------------- | -------------
Controller|
Plane   | takeoff
Airport | instruct_takeoff

airport --> instruct_takeoff --> plane
plane <-- takeoff --> returns left
airport <-- holds --> planes

Objects  | Messages
------------- | -------------
controller
Airport   | prevent_takeoff
 | prevent_landing
Weather | stormy?

airport <-- prevent_landing --> true/false
airport <-- prevent_takeoff --> true/false
weather <-- stormy? ---> true/false

Objects  | Messages
------------- | -------------
capacity | override
airport | prevent_landing_when_full

airport <-- capacity --> set/default
airport <-- prevent landing when full -->
