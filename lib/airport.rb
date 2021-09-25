class Airport
  attr_reader :airport

  def initialize
    @airport = []
  end

  def full?
    @airport.length
  end

  def takeoff(plane)
    plane
  end

  def land
  end
end
