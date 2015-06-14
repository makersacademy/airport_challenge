class Airport\

  def initialize
    @planes = []
    @capacity = 10
  end

  def instruct_plane_to_take_off plane
    plane.takeoff
    plane
  end

  def instruct_plane_to_land plane
    plane.land
    @planes << plane
  end

  def releases_a_plane plane
  end
end
