*** USER STORY 1 ***
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed

*** USER STORY 2 ***
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

*** USER STORY 3 ***
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

*** USER STORY 4 ***
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

*** USER STORY 5 ***
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

*** USER STORY 6 ***
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate



*** DOMAIN MODEL ***
|    Objects         |    Messages                                                             |
| -------------------| ------------------------------------------------------------------------|
| Plane              | Land_at(airport) with confirm                                           |
|                    | Take_off_from(airport) with confirmation, and it is removed from airport|
| AirTrafficControl  | approve_landing unless is_stormy                                      |
|                    | approve_take_off unless is_stormy                                     |
|                    | approve_landing unless airport is full                                   |
| Weather            | 30% chances Is_stormy / 70% chances !Is_stormy                          |
| Airport            | Has default capacity which can be overwritten                           |
|                    | Has planes                                                              |
