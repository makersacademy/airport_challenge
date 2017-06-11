
## Airport Challenge ##

A command-line script that controls the flow of aircraft in and out of airports.

The programme does several things. Two major constraints are set on aircraft flow: airports cannot land planes when their hangers are already full and cannot takeoff or land planes when weathering a storm. Logical constraints are also enforced - airports can't land or takeoff planes that are already grounded or airborne respectively. And location matters too. An airport can only takeoff planes that are in its own hanger, not those belonging to another airport.

The capacity of airports can be set on their creation. If not specified they will default to 20.
