# Example run of program used to create example log file
# Run from airport_challenge folder

require './lib/air_traffic_controller.rb'

# Set up objects
controller = AirTrafficController.new
luton = Airport.new({:iata_code => :LTN, :capacity => 28})
gatwick = Airport.new({:iata_code => :LGW, :capacity => 115})
heathrow = Airport.new({:capacity => 231})
a380 = Plane.new(:airport => heathrow, :flight_id => 'CW118')
boeing777 = Plane.new(:airport => luton, :flight_id => 'CW921')
g650 = Plane.new(:flight_id => 'CW024')

# Show controller actions
controller.tell_plane_to_depart({:airport => heathrow, :plane => a380})
controller.tell_plane_to_land({:airport => luton, :plane => a380})
controller.tell_plane_to_depart({:airport => luton, :plane => boeing777})
controller.tell_plane_to_land({:airport => gatwick, :plane => g650})
controller.tell_plane_to_land({:airport => heathrow, :plane => boeing777})
