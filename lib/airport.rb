require_relative "weather"

class Airport

  attr_reader :name
  attr_reader :capacity
  attr_reader :planes

  def initialize(name = "airport", capacity = 20)
    @name = name
    @capacity = capacity
    @planes = []
  end

  def take_off(plane)
    @planes.delete(plane)
    return "Plane successfully took off from the airport"
  end

  def land(plane)
    @planes << plane
    return "Plane successfully landed on the airport"
  end

  def full?
    @planes.count >= @capacity
  end

end
