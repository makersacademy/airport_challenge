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
Plane | takeoff
Airport | instruct_takeoff

airport --> instruct_takeoff --> plane
plane <-- takeoff --> returns left
airport <-- holds --> planes
