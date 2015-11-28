require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail 'Cannot land. Plane is not flying.' if plane.flying? == false
    @planes << plane
  end

end
