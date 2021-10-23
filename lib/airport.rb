class Airport

  def land(plane)
    fail "This airport is full" if @plane
    @plane = plane
  end

  def take_off
    "Taken Off"
  end
end