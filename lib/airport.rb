class Airport

  def land(plane)
    fail 'Plane can\'t land. Airport is full!' if @plane
    @plane = plane
  end

  def take_off(plane)

  end

end