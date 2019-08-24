class Airport

  attr_accessor :planes
  attr_accessor :flying

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
    plane.is_flying
  end

end
