require 'airport.rb'

class AirTrafficController < Airport
  # Air traffic Controller inherits an airport checks its variables 
  # before landing and releasing planes
  attr_reader :airport

  def initialize(airport = Airport.new)
    @airport = airport
  end

  def land(plane)
    raise "Stormy weather preventing landing" if stormy?
    raise "Airport Full" if hangar_full?
    raise "Plane already landed at airport" if hangar_include?(plane)
    ground_plane(plane)
  end
    
  def take_off(plane)
    raise "Stormy weather preventing take off" if stormy?
    raise "#{plane} not in airport" unless hangar_include?(plane)
    clear_plane(plane)
  end

  def hangar_full?
    hangar.length >= airport.capacity
  end

  def hangar_include?(plane)
    hangar.include?(plane)
  end

  def stormy?
    airport.weather == "stormy"
  end

  def flight_status(plane)
    plane.status
  end

  def hangar
    airport.hangar
  end
  
  private
  def ground_plane(plane)
    raise "Plane already landed at #{plane.location}" if plane.grounded?
    plane.status = "grounded"
    plane.location = airport
    hangar << plane
  end

  def clear_plane(plane)
    raise "Plane already airborne" if plane.airborne?
    plane.status = "airborne"
    hangar.delete(plane)
  end

end
