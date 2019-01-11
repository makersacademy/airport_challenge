require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
   @planes = []
  end

  def land_plane(plane)
    @planes << plane
    self
  end

  def take_off_plane(plane)
    @planes.delete(plane)
    self
  end

end
