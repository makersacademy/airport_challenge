Airport Challenge
=================

```
_______________                    
 ________________
            _\____\___
    =  = ==(____MA____))
              \_____\___________________,-~~~~~~~`-.._
              /     o o o o o o o o o o o o o o o o  |\_
              `~-.__       __..----..__                  ))
                    `---~~\___________/------------`````
                    =  ===(_________))

```


Steps
-------
While writing the solution to this challenge I used Rspec testing environment to TDD the features of the app. 

My first approach was to obtain an mvp:
- Airport giving instructions to one plane to land and later to take off and,
- the Plane having status of flying or landing. 

Subsequently added the features for:
- Airport keeping track of planes,
- Airport preventing planes from landing or taking off in unfavourable conditions
- Weather being randomly 'stormy' or 'sunny'. 
 
The Weather behaviour is stubbed in Rspec to prevent tests fail randomly. I kept the randomness in the feature test for a complete picture of the behaviour of the app.
  

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

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