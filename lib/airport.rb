require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes =[]
  end

  def land_plane(plane)
    @planes << plane
    plane.change_state(:landed)
  end

  def take_off(plane)
    @planes -= [plane]
  end
end
