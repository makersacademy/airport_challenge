require_relative './airport'

class Plane

  def initialize
    @location = 'air'
  end

  attr_accessor :location

  def land(airport)
    fail 'You cannot land - the airport is full.' if airport.at_capacity?

    @location = 'airport'
    airport.planes.push(self)
  end

  def take_off(airport)
    airport.planes.pop
    print 'Liftoff! We have a liftoff!'
    @location = 'air'
  end

end
