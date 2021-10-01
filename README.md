# Airport Challenge

## Intro

Welcome to my airport simulator. I have designed this Ruby application as an MVP for the back-end of an airport management application. The application can currently be run through the use of IRB. The code base has 100% code coverage and functionality that meets all the requested user stories. The current features include the creation of planes and airports, each with customisable settings. Planes and Airports are managed by an AirTrafficController (ATC) service which controls flying and landing of planes, as well as some other useful messages, such as listing all flying planes or a description of an airport.

A plane can land at any airport (provided the weather is acceptable) and it has clearance, Once landed, it may take off again (weather permitting). There are checks to make sure that a plane that has landed cannot land again, as well as checks to make sure that a plane that has requested to take-off is currently at the provided airport. There are two steps to landing and taking off planes. First of all clearance must be given. using the `clear_for_landing` or `clear_for_take_off` method on the `AirTrafficControl` service. Then the Take-off or Land method can be called. Once a plane has been given clearance to land/take-off, no other planes can land or take off at that airport until first plane has cleared the runway.

There is a 1 in 10 chance that either a take-off or landing will not be cleared due to bad weather

## Running the application

- To start the application use IRB to load `run.rb` file in the `/lib` folder (`irb -r ./run.rb`).
- This will get you started with the ATC configured - accessed with `$atc`.
- Useful methods:

| Method                 | use                                                                                                          | arguments              |
| ---------------------- | ------------------------------------------------------------------------------------------------------------ | ---------------------- |
| clear_for_take_off     | clears a plane for take-off, provided it is not already flying and the weather is clear                      | plane_id               |
| clear_for_landing      | clears a plane for landing, provided it is currently flying and the weather is clear                         | airport code, plane_id |
| take_off               | tells the plane to come in for landing, provided it has clearance and no other planes are using the runway   | airport code, plane_id |
| land                   | tells a plane to land at a given airport, provided it has clearance and no other planes are using the runway | airport_code, plane_id |
| add_plane              | adds a plane to be controlled through the ATC                                                                | Aeroplane              |
| add_airport            | adds an airport to be controlled through the ATC                                                             | Airport                |
| view_airport           | givens a description of the given airport                                                                    | airport_code           |
| view_planes_at_airport | returns a list of planes at the given airport                                                                | airport_code           |
| view_flying_planes     | returns a list of planes that are currently in the air                                                       |

## Design choices:

I had two ideas for my approach for this application. The first attempt had airports managing an array of planes ([first-attempt](https://github.com/stevej763/airport_challenge/tree/friday)) that had landed while the ATC managed flying planes.

While this approach passed all the tests and worked, I felt that having multiple arrays of planes and each array constantly adding and removing planes was both inefficient and risky. [So I started fresh](docs/plan_2.0.PNG) and decided to go with an attempt that would mean there is a single-source of truth for planes. I called this the PlaneManagementService. This is injected as a dependency on the ATC and holds all the plane objects under the management of the ATC and act as a repository to the ATC for everything to do with planes. I then created its twin for airports, the AirportManagementService. Now the ATC service has easy access to both airports and airplanes and both can be simplified. The plane simply holds a few fields such as an id, name and a status symbol matching the airport it is currently at such as :LHR or :flying if it is in the air. The ATC can then check with the weather service rather than each airport managing that individually and when errors are thrown by the airport the ATC can catch them and display a message explaining what went wrong, such as the airport being full.

## Code examples

```
$atc.clear_for_take_off(:CYFTCLDX)
 => "Plane CYFTCLDX (Airbus A330) cleared for take-off"

$atc.take_off(:GRU, :CYFTCLDX)
 => "Successful take off of CYFTCLDX at GRU"

 $atc.clear_for_landing(:MCO, :CYFTCLDX)
 => "plane CYFTCLDX (Airbus A330) cleared for landing"

$atc.land(:MCO, :CYFTCLDX)
 => "Successful landing of CYFTCLDX at MCO"
```

```
$atc.view_flying_planes
 =>
["1: CYFTCLDX - Airbus A330",
 "2: NMSHZWBK - Boeing 777",
 "3: XBAZRWSV - Boeing 737",
 "4: GQOAFNTO - Airbus A320",
 "5: XJIWPNAY - Airbus A220",
 "6: RPOPCTMK - Airbus A320",
 "7: YZTKGMXN - Airbus A220",
 "8: DAEGWMPP - Concord"]
```

```
$atc.clear_for_landing(:MCO, :CYFTCLDX)
=> Plane is not flying, it cannot land (PlaneNotFlyingError)

 $atc.clear_for_landing(:MCO, :QIJYKGTQ)
 => "Plane QIJYKGTQ (Concord) delayed landing due to bad weather at Orlando International Airport"

$atc.land(:MCO, :QIJYKGTQ)
 => "No planes cleared for landing"

 $atc.clear_for_take_off( :WSVUZUAZ)
 => "Plane WSVUZUAZ (Airbus A330) deplayed take-off due to bad weather at Orlando International Airport"
```

## Thoughts and comments

While I think this is a reasonable MVP given the time available, if I were to have more time there are a few things I would change.

First of all I am not catching every error and leaving them to throw at runtime, errors such as PlaneNotAtAirportError should probably just be caught and display a simple message. However, if I were to build a front-end for this application I would probably catch these errors higher up so used my time elsewhere.

I think I could also make my code a lot cleaner and follow Object Oriented patterns closer. Ideally, the AirTrafficControl class would be broken up further by having a `FlightTakeOffService` and a `FlightLandingService`, this would reduce the size of the `AirTrafficControl` class and hopefully bring it closer to purely being a resource to call on other services, rather than holding logic of it's own.

Finally, I feel like my logic for the airports is split up over three classes. The `AirTrafficControl` class checks the weather for landings, and organises printing out messages neatly. The `PlaneManagementService` holds the details for which planes are at which airport and the `Airport` class itself is responsible for checking the runway and if the capacity is reached. This will be confusing for other developers as the logic over which planes can land at each airport is managed by 3 different classes. Instead I should have a separate class which manages conditions for airports - which may itself be extracted out to further services, but it would be the sole request made from the `AirTrafficControl` class for if it is ok to land or take off at that airport.
