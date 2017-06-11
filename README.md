
## Airport Challenge ##

A CL-script controlling aircraft flow in and out of airports. Two major constraints are set on aircraft flow. One is that airports cannot land planes when their hangers are full, the other that airports cannot takeoff or land planes when it's stormy. Logical constraints are also present: airports can't land or takeoff planes that are already grounded or airborne respectively. And location matters. An airport can only takeoff its own planes, not those belonging to another airport.

The capacity of airports can be set on their creation. If not specified they will default to 20.
