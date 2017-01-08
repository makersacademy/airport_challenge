##First Week's Challenge

###Domain model

####User Story 1:

Client user story:
```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport and confirm that it has landed
```

Proposed domain model:

| Objects        | Messages     |
| ------------- |:-------------:|
| ATC           |               |
| Plane         | landed_status |
| Airport       | land_plane    |


####User Story 2:

Client user story:
```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

Proposed domain model:

| Objects       | Messages      |
| ------------- |:-------------:|
| ATC           |               |
| Plane         | landed_status |
| Airport       | take_off      |

The first iteration of the model assumes a first-in-first_out (FIFO) time-basis of landing and take-off. This is to be confirmed with the client.

####User Story 3:

Client user story:
```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```

Proposed domain model:

| Objects/Modules       | Messages      |
| ----------------------|:-------------:|
| ATC                   |               |
| Airport               | take_off      |
| Weather(mod)          | stormy?       |

The Weather module will be included in the Airport class. The Weather module will have a configurable constant `STORM_PROBABILITY` that is set to 50%. For testing purposes the value of `STORM_PROBABILITY` will be stubbed at 100% (stormy weather) and 0% (good weather).

####User Story 4:

Client user story:
```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```
Proposed domain model:

| Objects/Modules       | Messages      |
| ----------------------|:-------------:|
| ATC                   |               |
| Airport               | land_plane    |
| Weather(mod)          | stormy?       |

The Weather module will be included in the Airport class. The Weather module will have a configurable constant `STORM_PROBABILITY` that is set to 50%. For testing purposes the value of `STORM_PROBABILITY` will be stubbed at 100% (stormy weather) and 0% (good weather).

####User Story 5:

Client user story:
```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```

Proposed domain model:

| Objects       | Messages      |
| ------------- |:-------------:|
| ATC           |               |
| Airport       | land_plane    |
| Airport       | at_capacity?  |

The `land_plane` method of the Airport class will have access to a private `at_capacity` method in order to raise a error message.

####User Story 6:

Client user story:
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
Proposed domain model:

| Objects       | Messages      |
| ------------- |:-------------:|
| SD            |               |
| [TBD]         | [TBD]         |
| [TBD]         | [TBD]         |
