# Describes the AirTrafficController class
# Include the files we need
require_relative 'plane'
require_relative 'airport'

class AirTrafficController

  attr_accessor :airport

  def initialize
  end  

  def land(plane, airport)
    fail 'Plane already grounded!' unless plane.airbourne?
    fail 'Stormy weather, go to holding queue!' if airport.stormy_weather?
    fail 'Destination airport is full, go to holding queue!' unless airport.planes_list.length < airport.capacity
    puts "Plane landed successfully!"
    airport.dock_plane(plane)
  end
  
  def take_off
    # puts !plane.airbourne? ? "Ready for take off" : "Plane already airbourne"
  end  
end
