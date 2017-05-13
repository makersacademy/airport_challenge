class Airport

  def land_plane(plane)
    fail("Plane is already landed") unless plane.airborne?
    plane.landed
    plane
  end

end
