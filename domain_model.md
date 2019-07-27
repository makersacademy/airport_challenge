#Airport challenge Domain Model

|   Objects   |    Behaviours      |                                                                |
|-------------|--------------------|----------------------------------------------------------------|
|Airport      |instruct take off   | -> Plane takes off from Airport                                |
|             |instruct landing    | -> Plane lands at Airport                                      |
|             |prevent take off    | -> Weather stormy? -> true                                     |
|             |prevent landing     | -> Airport full? -> true                                       |
|             |has default capacity| -> New airport has default capacity if no capacity specified   |
|             |full?               | -> Airport's capacity >= number of planes landed?              |
|Plane        |is flying?          |                                                                |
|             |current airport?    | land -> current airport                                        |
|             |take off            | -> is flying                                                   |
|             |land                | -> is not flying                                               |
|Weather      |is stormy?          | -> random true or false, biaised towards false                 |