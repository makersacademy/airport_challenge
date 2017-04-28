As an air traffic controller.
So I can get passengers to a destination.
I want to instruct a plane to land at an airport and confirm that it has landed.

|Objects               | Messages      |
|----------------------|:-------------:|
|Air traffic controller|               |
|Passengers            |               |
|Destination           |               |
|Plane                 |land           |
|Airport               |landed?        |

As an air traffic controller.
So I can get passengers on the way to their destination.
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport.

|Objects               | Messages      |
|----------------------|:-------------:|
|Air traffic controller|               |
|Passengers            |               |
|Destination           |               |
|Plane                 |take_off       |
|Airport               |taken_off?     |

As an air traffic controller.
To ensure safety.
I want to prevent takeoff when weather is stormy.

|Objects               | Messages      |
|----------------------|:-------------:|
|Air traffic controller|               |
|Plane                 |take_off       |
|Weather               |stormy?        |

As an air traffic controller.
To ensure safety.
I want to prevent landing when weather is stormy.

|Objects               | Messages      |
|----------------------|:-------------:|
|Air traffic controller|               |
|Plane                 |land           |
|Weather               |stormy?        |

As an air traffic controller.
To ensure safety.
I want to prevent landing when the airport is full.

|Objects               | Messages      |
|----------------------|:-------------:|
|Air traffic controller|               |
|Plane                 |land           |
|Airport               |full?          |

As the system designer.
So that the software can be used for many different airports.
I would like a default airport capacity that can be overridden as appropriate.

|Objects        | Messages       |
|---------------|:--------------:|
|System designer|                |
|Airport        |DEFAULT_CAPACITY|
