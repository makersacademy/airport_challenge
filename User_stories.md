### User Stories

> As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

| Objects | Messages |
| :-------: | :--------: |
| Airport | land |

>As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

| Objects | Messages |
| :-------: | :--------: |
| Airport | take_off |

>As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

>As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

| Objects | Messages |
| :-------: | :--------: |
| Weather | is_stormy |

>As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

| Objects | Messages |
| :-------: | :--------: |
| Airport | full? |
