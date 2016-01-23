require_relative 'airport'
require_relative 'weather'

class Plane

  def land(airport, weather)
    raise "Too stormy to land!" if weather.stormy?
    raise "Plane has already landed!" if landed? == true
    @airport = airport
  end

  def takeoff(airport, weather)
    raise "Too stormy to takeoff!" if weather.stormy?
    raise "Plane cannot takeoff if it is not in an airport!" if at_what_airport == nil
    raise "Plane cannot take off from an airport it is not in!" if at_what_airport != airport
    @airport = nil
  end

  def landed?
    true if @airport
  end

  def at_what_airport
    @airport unless !@airport
  end


private

  attr_reader :airport


end
