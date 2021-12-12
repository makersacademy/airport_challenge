class Airport

  def land(plane)
    fail 'Airport is full - plane cannot land' if @plane
    @plane = plane
  end

  def takeoff

  end
end
