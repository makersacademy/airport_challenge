# User Stories

| Classes                | Methods                   | Conditions             |
|------------------------|---------------------------|--------------          |
| Airport                | instruct_landing          | if weather is sunny    |
| Plane                  | land                      | if instructed & sunny  |
| Plane                  | landed?                   | check land             |
| Airport                | prevent_landing           | if stormy or @ capacity|
| Airport                | instruct_takeoff          | if weather is sunny    |
| Plane                  | takeoff                   | if weather is sunny    |
| Plane                  | departed?                 | check takeoff          |
| Airport                | prevent_takeoff           | if weather is stormy   |
| Airport                | weather (stormy/clear)    |
| Airport                | user_changeable_capacity  |
| Airport                | full?                     |

As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

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
