require_relative './airport'

class Plane

  def initialize
    @location = 'air'
  end

  attr_reader :location

  def land(airport)
    fail 'You cannot land - the airport is full.' if airport.at_capacity?

    return unless @location == 'air'

    @location = 'airport'
    airport.plane_land(self)
    'Plane has now landed'
  end

  def take_off(airport)
    return unless @location == 'airport'

    if airport.plane_take_off(self)
    @location = 'air'
    'Liftoff! We have a liftoff!'
    end
  end
end
