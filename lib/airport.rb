# understading airport object
require_relative 'plane'
class Airport
  attr_reader :plane

  def takeoff
    @plane
  end

  def land(plane)
    raise 'Airport is full now' if @plane != nil

    @plane = plane
  end

end
