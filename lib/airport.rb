class Airport
  attr_reader :plane, :weather
  def land(plane)

    @plane = plane
  end

  def take_off
    @plane = nil
  end

end
