# Airport Challenge

Software to control the flow of planes at an airport.

The planes can land and take off provided the weather is sunny.
If it is stormy, no planes can land or take off.


```
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
```

### User Story #1

| User        | Message         |
|-------------|-----------------|
| controller  |                 |
| passengers  |  to_destination |
| plane       |  land           |
| airport     |  confirm_landed |

passengers <-- to_destination --> true/false
plane <-- land --> true/false
airport <-- comfirm_landed --> true/false

### User Story #2

| User        | Message           |
|-------------|-------------------|
| controller  |                   |
| passengers  |  to_destination   |
| plane       |  take_off         |
| airport     |  confirm_take_off |

passengers <-- to_destination --> true/false
plane <-- take_off --> true/false
airport <-- comfirm_take_off --> true/false

### User Story #3

| User        | Message           |
|-------------|-------------------|
| controller  |                   |
| weather     | stormy?           |

weather <-- stormy? --> true/false
plane <-- take_off --> true if weather not_stormy, false if weather stormy

### User Story #4

| User        | Message           |
|-------------|-------------------|
| controller  |                   |
| airport     |  capacity_full    |

airport <-- capacity_full --> true/false

### User Story #5

| User              | Message                 |
|-------------------|-------------------------|
| system designer   |                         |
| software          | used for many airports  |
| default capacity  | can be overridden       |
