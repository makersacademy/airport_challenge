#Airport challenge - Weekend 1


```
 \---------------------------------\
  \             (.  \               \
   \              \ |___(\--/)        \        __
    \           __/    (  . . )        \       | \
     >         "'._.    '-.O.'          >------|  \       ______
    /                 '-.  \ "|\       /       --- \_____/**|_|_\____  |
   /                    '.,,/'.,,     /          \_______ --------- __>-}
  /----------------------------------/              /  \_____|_____/   |
                                                    *         |
                                                             {O}

       /*\       /*\       /*\       /*\       /*\       /*\       /*\
      |***|     |***|     |***|     |***|     |***|     |***|     |***|
       \*/       \*/ ____  \*/       \*/       \*/       \*/       \*/
        |         |  |  |   |         |         |         |         |
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
```
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
|---------------:|:-------------------:|
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

We want a plane **NOT** to take-off during a 'storm?'

'storm' = create a ture/false situation in terms of 'Weather'

|Objects|Messages|
|---------------:|:-------------------:|
|Air Traffic Controller||
|Weather| storm? (if storm? = true, will stop take-off method occuring)|
```
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```
We want a plane **NOT** to land during a 'storm?'

'storm' = create a ture/false situation in terms of 'Weather'

|Objects|Messages|
|---------------:|:-------------------:|
|Air Traffic Controller||
|Weather| storm? (if storm? = true, will stop landing method occuring)|
```
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 
```
We want to set a **MAX**.capacity for the airport to stop more planes 'Landing'

Create a Capacity constant that will reject the 'landing' method but allow the 'take-off' method to reduce capacity

landing (-= 1), take-off (+= 1) to capacity

|Objects|Messages|
|---------------:|:-------------------:|
|Air Traffic Controller||
|Airport|capacity(additional use of landing and take-off methods to effect capacity)|
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```
**(Change of user)**

Allow there to be the ability to set airports to variable capacity whilst also keeping the Set capacity if no changes are wanted

|Objects|Messages|
|---------------|:-------------------:|
|Air Traffic Controller||
|Airport|capacity (Have the ability to create a variable capacity)|

Class overview and object behaviour:

-**Airport**(Effected by **Plane**): 


Capacity, variable capacity

-**Plane**(Effected by **Weather**, and 'Landing' method effected by **Airport** capacity): 


Flying?**=**Take-off or Landing

-**Weather**(Randomly generated?): 


Storm? and Clear? (required true/false statement in order to prevent 'Landing' and 'Take-off')

**======================================================================**

Steps:

**NOTES**:

Need to figure out which tests and emthos to use first:

Landing -> Airport -> Take_off

Weather is randomly generated, create number range that decide once a limit is reached it is "Raining" or "Clear".

It is more likely to be "Clear" than "Raining", take limitations into account, plus make the weather system Loop for eah plane object undergoing a Take-off / Landing method

**READ TEST DOUBLES**

Create a Test that lands and takes off multiple planes? Create a method that accepts multiple **BUT** limitted number of objects at a time (runways?)


1. Make directories lib + spec
2. Create Airport.rb/_spec.rb (to lib/spec)
3. Create Weather.rb/_spec.rb (to lib/spec)
4. Create Plane.rb/_spec.rb (to lib/spec)
5. Make Plane Object with Land/Take-off Behaviours (Rspec first)
6. Make Airport capacity constant with Rspec that tests Plane objects entering/leaving
7. Make Weather, Storm? method to effect Plane object behaviour
8. 






