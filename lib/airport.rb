class Airport
  def land(plane)
    raise RuntimeError, "Plane is already landed." if plane.landed
  end
end
