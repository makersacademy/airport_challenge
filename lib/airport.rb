require_relative 'plane.rb'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail "Airport is full" if @planes.count >= 50
    plane.land
    @planes << plane
  end

  def take_off(plane)
    fail "Plane is not in airport" unless @planes.include?(plane)
    plane.take_off
    @planes.delete(plane)
    plane
  end



end
