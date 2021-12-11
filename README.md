This script is for air traffic controllers to control the flow of planes at an airport:
        - when sunny, planes can land and take off
        - when stormy, planes cannot land or take off



User stories:

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

| Object | Message |
| --- | --- |
| air_traffic_controller |  |
| passengers | get_to_destination |
| plane | land |
| plane | take_off |
| safety | ensure |
| landing | prevent |
| system_designer |  |
| software |  |
| airport_capacity | be_default / can_be_overriden |
| weather | randomise |
| traffic_controler | prevent_take_off |
| traffic_controler  | prevent_landing |

Domain model:
![Domain Model Image](/assets/domain_model.jpg)

