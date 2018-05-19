require_relative 'plane'

class Airport

attr_reader :planes

  def initialize
    @planes = []
  end
  def land_plane(plane)
    @planes << plane
  end
  def take_off
    fail "Stormy weather" if stormy?
    @planes.pop
  end
  def stormy?
    false
  end
end
