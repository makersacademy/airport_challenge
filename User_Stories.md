As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

|Objects |Messages|
|--------|--------|
|passengers|
|plane|
|airport|land|


As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

|Objects |Messages|
|--------|--------|
|passengers|
|plane|
|airport|land, take_off, planes|


As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

We want to introduce a cap to how many planes can land. I have set this to a magic number 25

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

We want to introduce a capacity variable rather than magic numbers, that can be overwritten.

|Objects |Messages|
|--------|--------|
|passengers|
|plane|
|airport|land, take_off, planes, capacity|

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

|Objects |Messages|
|--------|--------|
|passengers|
|plane|
|airport|land, take_off, planes, capacity, stormy?|

Create stormy? method that returns true 1 in x times.
If it is stormy, the take_off method should raise an error.

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 

Same as above but land should raise an error if stormy