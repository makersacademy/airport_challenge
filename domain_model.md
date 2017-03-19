# Domain Model

## First User Story:
As an Air Traffic Controller, So I can get passengers to a destination, instruct a plane to land at an airport and confirm that it has landed.

Nouns: As an **air traffic controller**, so i can get to passengers to a destination, I want to instruct a **plane** to land at an **airport** and confirm it has landed.
Verbs: As an air traffic controller, so i can get to a destination, I want to instruct a plane to **land** at an airport and **confirm** it has landed.

### Objects:
1. User (Air Traffic Controller)
2. Airport
3. Plane

### Messages:
Plane => Status
Plane => Land
Plane => Check status to see if plane has landed

## Second User Story:
As an Air Traffic Controller, so I can get passengers on the way to their destination, I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport.

Nouns: As an **Air Traffic Controller**, so I can get passengers on the way to their destination, I want to instruct a **plane** to take off from an **airport** and confirm that it is no longer in the airport.
Verbs: As an Air Traffic Controller, so I can get passengers on the way to their destination, I want to instruct a plane to **take off** from an airport and **confirm that it is no longer in the airport**.

### Objects:
1. User (Air Traffic Controller)
2. Airport
3. Plane



## Third User Story:
As an Air Traffic Controller, To ensure safety, I want to prevent takeoff when weather is stormy.

Nouns: As an **Air Traffic Controller**, To ensure safety, I want to prevent takeoff when **weather** is stormy.
Verbs: As an Air Traffic Controller, To ensure safety, I want to **prevent takeoff** when weather is stormy.

### Objects:
1. User (Air Traffic Controller)
2. Airport
3. Plane
4. Weather

### Messages:
Weather => Provide weather check
Airport => Prevent take off when weather is stormy

### Messages:
Airport => Take off Plane
Airport => Confirm Take off
