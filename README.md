=================
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

## Install
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`
4. Complete the following task:

## Summary
-----
This program is designed to control the flow of planes at an airport.
The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  

*Main Objectives:*  
```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

*Safety features:*   
```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```

*Developer features:*   
```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

*Additional features:*    
```
Planes that are already flying cannot takes off.

Planes that are landed cannot land again.
```

## Plane
-----
When initialising a plane, by default it will have its status set as :grounded.    

*land*    
When calling .land on a plane, please pass in the airport you wish to land in as an argument:
plane.land(airport)
The land method will then run guard checks to see if the whether is stormy, the airport is at max capacity and check weather your plane is already grounded.
If these guard statements pass the passed in airport will add 1 to is number of planes & the planes status will change to :grounded     

*takeoff*     
When calling .takeoff on a plane, the .takeoff method will run guard checks to see if the whether is stormy & check weather your plane is already airbourne.
If these guard statements pass the planes status will change to :airbourne.    

## Whether
-----
When initialising Whether, a random number is set by a random number generator and will create a number between 0 and 3.    

*there_a_storm?*     
Calling .there_a_storm? will return true if the random number equals 0 and false each other time. Meaning there is a one in four chance of a storm.    

#Airport    
-----
When initialising Airport, a default capacity is created of 20. A custom capacity can be set when creating a new Airport by passing in a value as an argument:
airport = Airport.new(50)
Additionally on initialisation the number of plane is set to zero.
