require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail 'Airport full' if @planes.count >= 6
    @planes << plane
    plane.land
  end

  def take_off(plane)
    @planes.pop
    plane.take_off
  end


end
