class Airport
  attr_reader :planes

  def land_plane(plane)
    @planes = plane
  end

  def take_off_plane(plane)
    fail "Plane not at airport!" if @planes != plane
    @planes = nil
    plane
  end

end
