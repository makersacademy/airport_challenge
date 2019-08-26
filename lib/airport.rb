class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    @planes.delete(plane)
  end

  def is_parked?(plane)
    @planes.include?(plane)
  end

end
