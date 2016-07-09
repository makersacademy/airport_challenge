Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed
```
|Objects| Message|
| ----- |:-------|
|_Air Traffic Controller_| |
|Passengers|to_arrive|
|Airport|land_pane|
|Plane|confirm_landing|

```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

```
|Objects| Message|
| ----- |:-------|
|_Air Traffic Controller_| |
|Passengers|to_leave|
|Airport|plane_depart|
|Plane|confirm_departure|

```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

```
|Objects| Message|
| ----- |:-------|
|_Air Traffic Controller_| |
|Weather|prevent_take_off_if_stormy|

```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

```
|Objects| Message|
| ----- |:-------|
|_Air Traffic Controller_| |
|Weather|prevent_landing_if_stormy|

```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```
|Objects| Message|
| ----- |:-------|
|_Air Traffic Controller_| |
|Airport|prevent_landing_if_full|

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
|Objects| Message|
| ----- |:-------|
|_System Designer_| |
|Software| airports|
|Airport|default_capacity|
|Airport|override_capacity|
