require_relative 'airport'
require_relative 'weather'
require_relative 'takeoff_land'

class Plane

  include TakeoffLand

  def land(airport, weather)
    plane_landed_error
    airport.add_plane(self)
    @airport = landing(airport, weather)
  end

  def takeoff(airport, weather)
    plane_not_in_an_airport_error
    plane_not_in_right_airport_error(airport)
    taking_off(airport, weather)
    airport.remove_plane(self)
    @airport = nil
  end

  def landed?
    true if @airport
  end

  def at_what_airport
    @airport if @airport
  end


  private

  attr_reader :airport

  def plane_landed_error
    fail "Plane has already landed!" if landed? == true
  end

  def plane_not_in_an_airport_error
    fail "Plane cannot takeoff if it is not in an airport!" if at_what_airport == nil
  end

  def plane_not_in_right_airport_error(airport)
    fail "Plane cannot take off from an airport it is not in!" if at_what_airport != airport
  end

end
