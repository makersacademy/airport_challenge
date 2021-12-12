class Airport

  def initialize
    @planes = []
  end

  def land(plane)
    fail 'At maximum capacity' if @planes.count >= 10
    @planes << plane
  end

  def take_off
    true
  end

end