As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

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

# Plane
<!-- Land -->
<!-- Take off -->

# Airport
<!-- full? -->
<!-- (default) airport capacity -->
<!-- add/remove planes to capacity based on landing/takeoff -->

# Weather Inspector
safe? (to take off or land)



planes that are landed cannot land again and must be in an airport, etc.

# TODO TASKS                                              DONE
# ------------------------------------------------------------
# Airport has a default capacity of 100                   DONE
# planes can only take off from airports they are in      DONE
# flying planes cannot takes off/be in an airport         DONE