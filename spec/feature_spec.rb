require_relative '../lib/airport'
require_relative '../lib/plane'
require_relative '../lib/weather'

london_airport = Airport.new("LHR") # arguments : name, capacity(opt), weather(opt)
new_york_airport = Airport.new("EWR")
chicago_airport = Airport.new("ORD")
london_plane = Plane.new # arguments : location(opt), status(opt)
# london_airport.initiate_landing_procedure(london_plane)
new_york_plane = Plane.new
chicago_plane = Plane.new

p "A plane at london airport, has just asked if it can take off."
p "Depending on the weather it will be allowed to take off."
# london_airport.initiate_take_off_procedure(london_plane)
p "Ahh... Plane from London airport has just taken off."
p "A plane on route to London airport from chicago is asking permission to land."
p "Hope the weather is sunny!"
# london_airport.initiate_landing_procedure(chicago_plane)
p "Flight from chicago has safely landed."
p "Now the plane from London will hopefully land at New York if the airport is not full and there are no storms!"
# new_york_airport.initiate_landing_procedure(london_plane)
p "Ooo, why is New York airport getting take off requests from a plane in London?"
p "Better let them know via raising an error"
# new_york_airport.initiate_take_off_procedure(chicago_plane)
