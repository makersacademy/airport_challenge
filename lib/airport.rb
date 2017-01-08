require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def take_off
    Plane.new
  end

  def land(plane)
    plane.landed = true
    @planes << plane
  end



end
