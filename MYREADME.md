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
