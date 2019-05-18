Airport Challenge
=================

```
__|__
\___/
 | |
 | |
_|_|______________
        /|\ 
      */ | \*
      / -+- \
  ---o--(_)--o---
    /  0 " 0  \
  */     |     \*
  /      |      \
*/       |       \*
```

Steps
--------

1. Run the command `gem install bundle` (if you don't have bundle already)
2. When the installation completes, run `bundle`
3. Runs via IRB

User Stories
--------

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
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
```

Approach
--------