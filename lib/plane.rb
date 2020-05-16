require_relative './airport'

class Plane

  def initialize
    @location = 'air'
  end

  attr_reader :location

  def land(airport)
    fail 'You cannot land - the airport is full.' if airport.at_capacity?

    airport.plane_land(self)
    @location = 'airport'
    'Plane has now landed'
  end

  def take_off(airport)
    if @location == 'airport'
      airport.plane_take_off
      @location = 'air'
      'Liftoff! We have a liftoff!'
    end
  end
end
