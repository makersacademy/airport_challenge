# User story 1
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

# Nouns
air traffic controller, passengers, destination, plane, airport

# Verbs
get, instruct, land

# Functional representation
Objects:
- plane
- airport

Messages:
- land

# Diagram
Airport <--land--> Plane


##################################
# User story 2
As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

# Nouns
air traffic controller, passengers, destination, plane, airport

# Verbs
get, instruct, take off, confirm

# Functional representation
Objects:
- Airport
- Plane

Messages: 
- take_off
- left_airport?

# Diagrams
Airport <--take_off--> Plane

Plane <--left_airport?--> true


##################################
# User story 3
As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

# Nouns
air traffic controller, safety, airport, full

# Verbs
ensure, prevent, landing

# Functional representation
Objects:
- Airport
- Plane

Messages:
- landing
- full?

# Diagrams
Airport <--landing--> Plane

Airport <--full?--> true/false


##################################
# User story 4
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

# Functional representation
Objects:
- Airport

Messages:
- set_capacity

Airport <--set_capacity--> num


##################################
# User story 5
As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

# Functional representation
Objects:
- Airport
- Weather
- Plane

Messages:
- prevent_take_off

# Diagrams
Airport <--take_off--> Plane
Weather <--stormy?--> ture/false


##################################
# User story 6
As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 

# Functional representation
Objects:
- Airport
- Weather
- Plane

Messages:
- prevent_landing

# Diagrams
Airport <--land--> Plane
Weather <--stormy?--> true/false


##################################

# Edge cases
- planes can only take off from airports they are in;
# done
- planes that are already flying cannot take off and/or be in an airport; 
  (when plane lands left_airport? should be false)
# 
- planes that are landed cannot land again and must be in an airport


##################################