class Airport
  def initialize
    @planes = []
  end

  def land(plane)
    @planes.push(plane)
  end

  def take_off(plane)
    @planes.delete(plane)
  end

  def hangar?(plane)
    @planes.include?(plane)
  end
end
