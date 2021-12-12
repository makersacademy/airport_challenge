class Airport
  def empty?
    true
  end

  def full?
    @plane != nil
  end

  def receive(plane)
    fail "Sorry, Hangar Full" if full?
    @plane = plane
  end
end
