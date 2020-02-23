# Airport Challenge
=================
Makers weekend challenge (week 1)

## Aim
To write software to control the flow of planes at an airport.

### Additional aims
* Planes can land and take off provided that the weather is sunny.
* If the weather is stormy the planes cannot take off.
* Planes cannot land if the airport is full.
**Edge cases**
* Ensuring that planes can only take off from airports they are in.
* Planes that are already flying cannot take off and/or be in an airport
* Planes that are landed cannot land again and must be in an airport

**User Stories**
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

## Installation instructions
-------

1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundle`
3. When the installation completes, run `bundle`

