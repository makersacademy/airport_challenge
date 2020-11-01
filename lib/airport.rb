require_relative 'plane'

class Airport
  attr_reader :plane

  def land(plane)
    @plane
    # hangar = []
    # hangar << @plane
  end

  def take_off(plane)
    @plane = plane
  end

end
