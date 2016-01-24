class Airport
  def initialize
    @planes = []
  end

  def planes
    @planes.dup
  end

  def land_plane(plane)
    @planes << plane
  end

  def clear_plane_for_take_off
    @planes.pop
  end
end
