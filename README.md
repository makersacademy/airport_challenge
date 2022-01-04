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

#Adam Hindmarsh README

##Decription 
This project is to replicate the aid a air traffic controller to be able to monitor planes taking off and landing at different places. The program also ensures safety when planes are taking off and landing. 


##How to use

This program needs to be ran in the terminal using command prompts. 
You will need to clone the Repo from GitHub and run it using IRB requiring './lib/airport' to begin. 

There are two classes of objects that are used in the programs: Planes and Airports

###Planes don't have any direct methods but their landed status can be read by using the message '.landed'.

###Airports 
'.new' or '.new(50)' the argument sets the capacity of the airport. The default value is 20. 
'.land(plane)' lands a plane at that airport.
'.take_off(plane)' departs a plane from that airport.

Planes cannot be landed when they are already landed at an airport. 
A plane cannot take off from an airport that is has not landed at.
A plane which has taken off can not then take off again. 



