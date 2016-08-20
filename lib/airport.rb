require_relative 'plane'

class Airport

  attr_reader :plane

  def allow_to_land(plane)
    plane.instruct_to_land
    @plane = plane
  end

  def take_off

  end

end
