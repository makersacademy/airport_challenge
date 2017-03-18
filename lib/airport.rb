require_relative 'plane'

class Airport
  attr_reader :plane

  def land(plane)
    @plane = plane
  end

  def take_off
    raise "No planes at the airport" if !plane
    plane
  end

end
