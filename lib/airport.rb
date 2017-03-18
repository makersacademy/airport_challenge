require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    plane.landed?
  end

  def add_plane(plane)
    planes << plane
  end

end
