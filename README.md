### Airport Challenge

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

### Task
    
• We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off. 

### Process to solve the task              

• Tackled everything one step at a time.
• Transformed the User Story into a Domain Model.
• Made a diagram that shows how Objects will use Messages to communicate with one another.

### User Stories

As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

### User Stories Table Representation

| Objects                     | Messages          |
| --------------------------- | ----------------- |
| Air trafic controller       |                   |
| Passengers                  |                   |   
| Destination                 |                   |
| Plane                       | plane_at_airport? |
| Airport                     | take off / land   |

### User Stories Diagram

Plane <-- plane_at_airport? --> true/false
Airport <-- land --> Plane
Airport <-- take off --> Plane 
