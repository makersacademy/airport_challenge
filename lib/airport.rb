require_relative "plane"

class Airport

  def initialize
    @airport = []
  end

  def land(plane)
    @airport << plane
  end

  def take_off
    plane = @airport.pop
    "The plane #{plane} has left the airport"
  end
end
