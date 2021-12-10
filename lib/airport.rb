class Airport 

  def land(plane)
    fail "Airport at full capacity" if @plane
    @plane = plane
  end

  def depart(plane)
    @plane = nil
  end
end