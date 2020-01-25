class Airport

  parked_planes = []

  def tell_to_land(plane)
  end

  def tell_to_takeoff(plane)
    parked_planes -= plane
  end
end