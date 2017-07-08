class Airport
  attr_reader :plane
  # def plane
  #   @plane
  # end

  def land(plane)
    @plane = plane
  end

  def take_off(plane)
    @plane = nil
    "#{plane} has taken off"
  end
end
