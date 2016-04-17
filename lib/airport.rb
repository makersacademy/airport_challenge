require_relative 'plane'

class Airport

  attr_reader :planes
  attr_reader :capacity

  def initialize
    @planes = []
    @capacity = 20
  end

  def launch_plane
    @planes.pop
  end

  def land(plane)
    @planes << plane
  end

end