class Airport

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    plane
  end
end
