class Airport
  attr_reader :plane

  def land(plane)
    fail "The airport is full" if @plane
    @plane = plane
  end

  def take_off
    fail "The airport is empty" if !@plane
    @plane
  end

end
