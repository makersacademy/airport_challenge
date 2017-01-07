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

| Objects        | Measages      |
| ------------- |:-------------:|
| ATC           |               |
| Plane         | landed-status |
| Airport       | land_plane    |


####User Story 2:

Client user story:
```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

Proposed domain model:

| Objects       | Measages      |
| ------------- |:-------------:|
| ATC           |               |
| Plane         | landed-status |
| Airport       | take_off      |

####User Story 3:

Client user story:
```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```

Proposed domain model:

| Objects       | Measages      |
| ------------- |:-------------:|
| ATC           |               |
| [TBD]         | [TBD]         |
| [TBD]         | [TBD]         |

####User Story 4:

Client user story:
```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```

Proposed domain model:

| Objects       | Measages      |
| ------------- |:-------------:|
| ATC           |               |
| [TBD]         | [TBD]         |
| [TBD]         | [TBD]         |

####User Story 5:

Client user story:
```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```

Proposed domain model:

| Objects       | Measages      |
| ------------- |:-------------:|
| ATC           |               |
| [TBD]         | [TBD]         |
| [TBD]         | [TBD]         |


####User Story 6:

Client user story:
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
Proposed domain model:

| Objects       | Measages      |
| ------------- |:-------------:|
| SD            |               |
| [TBD]         | [TBD]         |
| [TBD]         | [TBD]         |
