require_relative 'plane'

class Airport

  attr_reader :grounded_planes

  def initialize
    @grounded_planes = []
  end

  def land(plane)
    @plane = plane
    @plane
  end

  def landed(plane)
    @grounded_planes << plane
    @grounded_planes
  end


end
