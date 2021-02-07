# Airport Challenge 

#### Challenge to build a command line airport simulation program. Able to:
- Store planes in airport objects 
- Land/takeoff planes
- Use randomly generated weather to determine plane permissions
- Use default or custom airport capaicty to determine plan permissions . 


## Getting Started 
```
 $ bunle install 
 $ git clone https://github.com/makersacademy/airport_challenge.git \
 $ cd airport_challenge \
 $ irb -r './docs/airport.rb' -r './docs/plane.rb' \

   can then create Plane and Airport objects
   ```
 ### Methods ###
 #### Airport Methods: ####
 - land(plane)
 - takeoff(plane)
 

## User Stories Used to Create Program
As an air traffic controller \
So I can get passengers to a destination \
I want to instruct a plane to land at an airport 

As an air traffic controller \
So I can get passengers on the way to their destination \
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller \
To ensure safety \
I want to prevent landing when the airport is full 

As the system designer\
So that the software can be used for many different airports\
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller \
To ensure safety \
I want to prevent takeoff when weather is stormy 

As an air traffic controller \
To ensure safety \
I want to prevent landing when weather is stormy_


## Running tests

 $ rspec 

  #### NOTES ### 
For this challenge the user stories have been successfulyl implemented. \
I have not managed to utilise stubs to prevent random weather in the tests. \
Instead I have used an if/else condition with default values to the same affect. \
This approach however, got quire complicated when attempting to add a "prevent takeoff when already flying \
& prevent landing when already landed" funciotnality. \
This was as far as I managed to make it. with regards to the instructions given. 