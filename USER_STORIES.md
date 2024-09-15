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
if true ---> take_off ---> airborne?
if false  ---> airport.land(plane) ---> airport.plane

# User story 2:
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

____________________
noun     |   verb
---------|----------
ATC      | prevent
System ds| landing 
plane    | overridden
airport  | 

plane ---> airport.full? ---> true / false
if true ---> raising_exception ---> prevent_landing
if false  ---> airport.land(plane) ---> airport.plane

# User story 3:
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

# Summary:

Unfortunately, I ended up having less time than hoped to complete this weekend assignment. I had so far split the 3x user stories and managed to complete most of the first user story with landing and taking_off. 

My next goal was to work on the second user story and to prevent a planes from being landed if the airport is full. I believe this would be done by creating a limited capacity on the airport. And to create a fail procedure once the airport is full otherwise to hold that plane instance. 

As part of the third user story, I believe stubs will play a major role; this is an area that i would like to explore later in week2. 

















