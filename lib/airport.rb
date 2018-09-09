require_relative 'plane'
class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    @planes << plane
  end

  def take_off
    #@planes.shift
  end

end
