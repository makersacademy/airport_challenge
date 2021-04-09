# Airport Challenge

#### Technologies: Ruby, Rspec

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


## Makers Academy - Week 1 Solo Weekend Project

## The Challenge

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  

The code allows for:

1 - Creation of a bike 2 - Reporting a bike as broken 3 - Docking of bikes at a docking station, ensuring that they are actually bikes and separating them into working and broken bikes. 4 - Loading of broken bikes onto a van to be taken away for repair. 5 - Unloading of broken bikes at a garage. 6 - Repairing of bikes at the garage. 7 - Loading of working bikes onto a van to be taken back to a docking station. 8 - Unloading of working bikes at a docking station.


Here are the user stories that we worked out in collaboration with the client:

### User Stories

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

I used a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In my tests, I used a stub to override random weather to ensure consistent test behaviour.
