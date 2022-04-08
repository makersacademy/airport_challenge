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
| METHODS    | land()                  |
| METHODS    | take_off()              |

| CLASS NAME | Plane           | 
|------------|-----------------|  
| VARIABLES  |                 |
| METHODS    | ready_to_land?  |
| METHODS    | flying?         |


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
- I can't figure out how to get line airport_spec.rb:18 to not throw an error (no1)
- I need to learn more about mocking/stubs/doubles

## Errors
- no1: 
```
1) Airport#take_off instructs a plane to take off
     Failure/Error: expect { subject.take_off }.to change(planes, :length).by(-1)
       expected `Array#length` to have changed by -1, but was changed by 0
     # ./spec/airport_spec.rb:18:in `block (3 levels) in <top (required)>'
```

----------------------------------------

## Experience 
I really wanted to be able to continue with the rest of this project. I was enjoying myself, but was unable to get past this error message (no1). I'm unsure whether its an incorrect use of the rspec "change" matcher syntax or I was over complicating things, or perhaps was misusing "arrange/act/assert". 

With the methods inside the Plane class I felt it was important to be able to check that a plane was ready_to_land(), before it landed in the airport. However I am aware this wasn't mentioned in the user stories, so i'm unsure whether I should have included it? 

The same goes for the flying?() method. My thinking was that the program would check if a plane was currently in flight to cover the edge case "planes that are already flying cannot take off and/or be in an airport". For now I have included a ternary statement in the take_off() method to give this confirmation.

I tried to focus on testing behaviour > state but I feel I still need better clarification on what this looks like in rspec itself. I have completed half of this workshop this. 

