class Airport

  def initialize
    @airplanes = []
  end

  def land(plane)
    @airplanes.push(plane)
    return @airplanes.length
  end

  def take_off(plane)
    @airplanes.delete(plane)
    return @airplanes.length
  end

end
