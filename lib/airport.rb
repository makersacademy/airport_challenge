class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def track_plane(plane)
    @planes << plane
  end

  def instruct_landing(plane)
    plane.land
  end

  def instruct_take_off(plane)
    plane.take_off
    @planes.pop
  end

end
