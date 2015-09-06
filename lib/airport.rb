class Airport

  def receive(plane)
    @plane = plane
    @plane.land
  end

  def release
    @plane.take_off
    @plane
  end

end
