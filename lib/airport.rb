require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def allow_to_land(plane)
    plane.instruct_to_land
    @planes << plane
  end

  def take_off(plane)
    plane.instruct_to_take_off
    @planes.delete(plane)
  end

end
