class Airport
  attr_reader :plane

  def land(plane)
    @plane = plane
  end

  def take_off
    fail "The airport is empty" if !@plane
    @plane
  end

end
