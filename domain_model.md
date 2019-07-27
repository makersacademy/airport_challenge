#Airport challenge Domain Model

|   Objects   |    Behaviours      |                                                                |
|-------------|--------------------|----------------------------------------------------------------|
|Airport      |instruct take off   | -> Plane takes off from Airport, plane is no longer in Arport  |
|             |instruct landing    | -> Plane lands at Airport, plane is now in the aiport          |
|             |clear for take off  | -> Weather stormy? -> error                                    |
|             |clear for landing   | -> Airport full? or stormy? -> error                           |
|             |has default capacity| -> New airport has default capacity if no capacity specified   |
|             |full?               | -> Airport's capacity >= number of planes landed?              |
|Plane        |is flying?          | -> true/false                                                  |
|             |current airport?    | land -> current airport                                        |
|             |take off            | -> is flying                                                   |
|             |land                | -> is not flying                                               |
|Weather      |is stormy?          | -> random true or false, biaised towards false                 |

###Edge cases: 
- Plane shouldn't be instructed to take off if flying, or not in airport.
- Plane shouldn't be instructed to land if not flying.

