class Airport
  def land(plane)
    fail "airport is full" if @plane
    @plane = plane
  end

  def takeoff(plane)
  end
end
