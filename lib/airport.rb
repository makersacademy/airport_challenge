require_relative 'plane'

class Airport
  attr_reader :plane

  def initialize
    @plane = []
  end

  def landing(plane)
    @plane << plane
  end

  def release_plane
    @plane.pop
  end

end
