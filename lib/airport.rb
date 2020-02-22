class Airport

  attr_reader :name
  attr_reader :planes
  attr_reader :capacity

  def initialize(name = "airport", capacity = 20)
    @name = name
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    @planes.delete(plane)
    return "Plane successfully took off from airport"
  end

  def full?
    @planes.count >= @capacity ? true : false
  end

end
