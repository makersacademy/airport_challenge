require_relative './airport'

class Plane

  def initialize
    @location = 'air'
  end

  attr_reader :location

  def land(airport)
    fail 'You cannot land - the airport is full.' if airport.at_capacity?

    @location = 'airport'
    airport.plane_land(self)
  end

  def take_off(airport)
    @location = 'air'
    airport.plane_take_off
    'Liftoff! We have a liftoff!'
  end

end
