require_relative 'plane'

class Airport

  attr_reader :plane

  def land(plane)
    @plane = plane
  end

  def take_off
    return @plane
  end

end
