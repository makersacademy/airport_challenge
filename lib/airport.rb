# this class takes care of the plane handling.
#Landing and takeoff.
require_relative 'plane'

class Airport
  attr_reader :planes

  def land(plane)
    @planes = []
    @planes << plane
  end

end
