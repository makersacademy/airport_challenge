require_relative "airport"
require_relative "plane"

# The below code showcases how the various methods should be used.
def airport_challenge_in_action
  # A number of airports should be created.
  # Here there are 3.
  Airport.create(3)

  # A number of planes should be created.
  # Here there are 3.
  Plane.create(3)

  # Prints the number of airports created.
  Airport.count

  # Prints the number of planes created.
  Plane.count

  # Prints the ID of all planes created.
  Plane.get_id

  # The status of the airports can be checked.
  # No planes have been landed so they all show zero.
  Airport.status

  # Lands a specific plane in a specific airport.
  Airport.land("Plane1", "Airport1")

  Airport.status

  # Makes a specific plane takeoff from a specific airport.
  Airport.takeoff("Plane1", "Airport1")

end

airport_challenge_in_action
