# User Stories

As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

nouns: air traffic controller, passengers, destination, plane, airport
verbs: instruct_plane_to_land, confirm_landed, instruct_plane_to_take_off, confirm_plane_left_airport


| Objects                | Messages                  |
|------------------------|---------------------------|
| Air Traffic Controller |                           |
| Passengers             |                           |
| Destination            |                           |
| Plane                  | departed?                 |
| Plane                  | landed?                   |
| Airport                | instruct_plane_to_land    |
| Airport                | instruct_plane_to_take_off|

plane <--> landed?  <--> true/false

plane <--> departed <--> true/false

airport <--> instruct_plane_to_land     <--> plane

airport <--> instruct_plane_to_take_off <--> plane



As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
