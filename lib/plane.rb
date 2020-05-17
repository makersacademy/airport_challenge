require_relative './airport'
require_relative './weather'

class Plane

  def initialize
    @location = 'air'
  end

  attr_reader :location

  def land(airport)
    fail 'You cannot land - the airport is full.' if airport.at_capacity?
    return 'You cannot land - the weather is bad' if airport.weather_is_bad?

    return unless @location == 'air'

    @location = 'airport'
    airport.plane_land(self)
    'Plane has now landed'
  end

  def take_off(airport)

    return 'You cannot take off - the weather is bad' if airport.weather_is_bad?

    return unless @location == 'airport'

    return unless airport.plane_take_off(self)
    
    @location = 'air'
    'Liftoff! We have a liftoff!'
  end
end
