# Project Title:
Airport Challenge

# Motivation: 
Attempt to complete the weekend challenge with an aim to reinforce learning outcomes from the last week. 

# Notable sources & references
https://ruby-doc.org/

# Build status:
Start
README / USERSTORIES.md
Testing stage

# User story 1:
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

____________________
noun     |   verb
---------|----------
ATC      | get
passenger| land 
plane    | take_off
airport  | confirm

plane ---> airport? ---> true / false
if true ---> take_off ---> airport?
if false  ---> land ---> airport.docked


# User story 2:
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

















