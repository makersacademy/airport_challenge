# Airport Challenge
We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. 

## User Story 1
```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport
```

### Nouns:
- air traffic controller
- passengers
- destination
- plane
- airport

### Verbs:
- instruct
- land

### Behaviour:
"land a plane"

### Functional representation:

|         Objects        | Messages |
|------------------------|----------|
| air traffic controller |          |
| plane                  | land()   |

### Diagram to show interaction:
Plane <-- land --> Airport

----------------------------------------

## Class Diagrams
| CLASS NAME | Airport                 | 
|------------|-------------------------|  
| VARIABLES  | @DEFAULT_CAPACITY : var |
| VARIABLES  | @                       |
| METHODS    | land()                  |
| METHODS    | take_off()              |

| CLASS NAME | Plane           | 
|------------|-----------------|  
| VARIABLES  |                 |
| METHODS    | ready_to_land?  |

| CLASS NAME | Weather   | 
|------------|-----------|  
| VARIABLES  |           |
| METHODS    | stormy?() | 

----------------------------------------

## User Story 2
```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport.
```

### Nouns:
- air traffic controller
- passengers
- destination
- plane
- airport

### Verbs:
- instruct
- take off
- confirm

### Behaviour:
"take off a plane"
"confirm the plane is flying"

### Functional representation:

|         Objects        | Messages     |
|------------------------|--------------|
| air traffic controller |              |
| plane                  | take_off()   |
|                        | flying?      |

### Diagram to show interaction:
Plane <-- flying? --> true/false
Airport <-- take_off --> if !flying?

----------------------------------------

## Issues
- I need to learn how to access methods within other classes?
- I need to better understand the use of .self within a class/it's use for accessing methods
- I need to continue getting more familiar with rspec syntax 
- I need to continue learning how to test 'behaviour > state'