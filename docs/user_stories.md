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

Airport <--take_off--> Plane

Plane <--left_airport?--> true/false