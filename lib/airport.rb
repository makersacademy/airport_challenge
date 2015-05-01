class Airport

  def initialize
    @parkedplanes = []
  end

  def land(plane)
    plane::status = "landed"
    @parkedplanes << plane
  end

  def take_off (plane)
    plane::status = "flying"
    @parkedplanes.delete(plane)
  end

end
