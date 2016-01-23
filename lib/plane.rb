require_relative 'airport'
require_relative 'weather'

class Plane

  def land(airport)
    @airport = airport
  end

  def takeoff(airport, weather)
    raise "Too stormy to takeoff!" if weather.stormy?
    @airport = false
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
