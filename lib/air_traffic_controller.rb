# Describes the AirTrafficController class
# Include the files we need
require_relative 'plane'
require_relative 'airport'

class AirTrafficController

  def initialize
  end  

  def land(plane, airport)
    fail 'Plane already grounded!' unless plane.airbourne?
    fail 'Stormy weather, go to holding queue!' if airport.stormy_weather?
    fail 'Destination airport is full, go to holding queue!' unless airport.planes_list.length < airport.capacity
    puts "Plane landed successfully!"
    airport.dock_plane(plane)
    airport.planes_list
  end
  
  def take_off(airport)
    fail 'There are no plans landed for turnaround at the moment!' if airport.planes_list.length <= 0
    fail 'Stormy weather, flight delayed!' if airport.stormy_weather?
    puts "We have take-off!"
    airport.planes_list.pop
    airport.planes_list
  end  
end
