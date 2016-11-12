require_relative 'plane.rb'

class Airport

  attr_reader :plane

  def land(plane)
    fail "Airport is full" if @plane
    plane.land
    @plane = plane
  end

  def take_off(plane)
    fail "Plane is not in airport" unless @plane
    plane.take_off
    @plane
  end



end
