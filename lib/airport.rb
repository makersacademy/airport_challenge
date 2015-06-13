class Airport
DEFAULT_CAPACITY = 50

  attr_accessor :capacity

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land_plane plane
    plane.land
    @planes << plane
  end

  def take_off_plane plane
    plane.take_off
    @planes.delete plane
  end

end
