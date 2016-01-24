require_relative 'airport'
require_relative 'weather'
require_relative 'takeoff_land'

class Plane

  include TakeoffLand

  def land(airport, weather)
    raise "Plane has already landed!" if landed? == true
    @airport = landing(airport, weather)
  end

  def takeoff(airport, weather)
    raise "Plane cannot takeoff if it is not in an airport!" if at_what_airport == nil
    raise "Plane cannot take off from an airport it is not in!" if at_what_airport != airport
    taking_off(airport, weather)
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


end
