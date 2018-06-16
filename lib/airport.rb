require_relative 'plane'

class Airport

  def land(plane)
    @plane = plane
  end

  attr_reader :plane

  def take_off(plane)
    @plane = plane
  end

end
