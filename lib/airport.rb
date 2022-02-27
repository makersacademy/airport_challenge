class Airport

  def receive(plane)
    @plane = plane
    return true
  end

  def release(plane)
    @plane = nil
    return true
  end
end