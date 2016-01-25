require_relative 'airport'
require_relative 'weather'

class Plane

  def land(airport, weather)
    too_stormy_to_land(weather)
    plane_landed_error
    airport.add_plane(self)
    @airport = airport
  end

  def takeoff(airport, weather)
    too_stormy_to_takeoff(weather)
    plane_not_in_an_airport_error
    plane_not_in_right_airport_error(airport)
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

  def too_stormy_to_takeoff(weather)
    raise "Too stormy to takeoff!" if weather.stormy?
  end

  def too_stormy_to_land(weather)
    raise "Too stormy to land!" if weather.stormy?
  end

end
