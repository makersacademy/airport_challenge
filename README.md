Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

Instructions
---------


We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:


User stories:

airport: instruct plane to land
         instruct plane to take off
         prevent landing if airport full
         prevent takeoff if stormy
         prevent landing if stormy
plane: land
       take off
weather: be stormy
         be sunny
system designer: override airport capacity


Testing:
I am not fully confident in my knowledge of how to write tests for TDD.
I began writing simple tests that passed after I wrote code for them.
After writing more simple tests and code I realised that the simple tests I had written were wrong and not really testing anything.
I tried to go back and change the tests to make them pass with the code I had written.
These then all failed but I didn't understand how to write them correctly or have the time to change tests and code.
Further work needs to be done to increase my understanding of TDD and how to write the tests.