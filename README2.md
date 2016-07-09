#Airport challenge - Weekend 1

User inputs and requirements; convert to Object::message table 

***```Primary Object``` → ```Reference Object``` → ```Message```***
```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport and confirm that it has landed
```
We want a plane to land at an airport and have a status change to 'Landed'

'Landed' = create a true/false situation in terms of 'Plane_flying'

|Objects|Messages|
|---------------|:-------------------:|
|Air Traffic Controller||
|Plane| Plane_flying(landed = false) |
```
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```
We want a plane to take-off at an airport and have a status change to 'Flying'

'Flying' = create a true/false situation in terms of 'Plane_flying'

|Objects|Messages|
|---------------|:-------------------:|
|Air Traffic Controller||
|Plane| Plane_flying (flying = true)|
```
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 
```





