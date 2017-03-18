class Airport

  def initialize
    @airport = []
  end

  def land(plane)
    @airport << plane
  end

  def take_off
    @airport.pop
  end
end
