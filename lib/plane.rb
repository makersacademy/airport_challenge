require_relative "weather.rb"
require_relative "airport.rb"

class Plane
  attr_reader :airborne
  alias_method :airborne?, :airborne

  def initialize(airborne=true)
    @airborne = airborne
  end

  def land(airport)
    raise "Cannot land - already landed!" unless airborne?
    raise "Cannot land - weather is stormy!" unless sunny?
    raise "Cannot land - airport is full!" if airport_full?(airport)
    set_airborne(false)
    dock_at_airport(airport)
    "Plane has landed in sunny weather at #{airport.airport_name}"
  end

  def take_off(airport)
    raise "Cannot take off - am not landed at #{airport.airport_name}!" unless docked_at_airport?(airport)
    raise "Cannot take off - already airborne!" if airborne?
    raise "Cannot take off - weather is stormy!" unless sunny?
    set_airborne(true)
    undock_from_airport(airport)
    "Plane has taken off from #{airport.airport_name}"
  end

  private

  def set_airborne(status)
    @airborne = status
  end

  def sunny?
    Weather.sunny?
  end

  def airport_full?(airport)
    airport.full?
  end

  def dock_at_airport(airport)
    airport.dock(self)
  end

  def undock_from_airport(airport)
    airport.undock(self)
  end

  def docked_at_airport?(airport)
    airport.has_plane_docked?(self)
  end

end
