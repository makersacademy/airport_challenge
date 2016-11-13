class Airport

  def land_plane
    Plane.new
  end

  def take_off
    fail "Bad weather - no planes can take off" unless @plane
    Plane.new
  end

end
