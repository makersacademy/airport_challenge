class Airport

  attr_reader :plane

  def land(plane)
    @plane = plane
  end

  def take_off
    raise RuntimeError, "There are no planes" unless @plane
    @plane
  end
end
