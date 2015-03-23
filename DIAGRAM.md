Airport
====================

###Class - Plane

Responsibilites             | Collaborators
----------------------------|------------------
Be landed                   | Pilot, Airport, no-full, sunny
Be take_off                 | Pilot, Airport, sunny
Be flying                   | Pilot, full, storm
Be holding            | Pilot, storm, Airport

### Class - Pilot
Responsibilites     | Collaborators
--------------------|------------------------
Land                |  Plane, Controller, Airport,
Take off            |  Plane, Controller, Airport
Fly               |  Plane, Airport

### Class - Airport
Responisibilites        |Collaborators
------------------------|------------------
Receive                 | Plane, Weather, Destination
Reject                  | Plane, Weather, Full, Destination
Holding                 | Plane, Controller, Weather

### Class - Controller
Responisibilites        |Collaborators
------------------------|------------------
Inform                | Plane, Airport, Weather, Destination