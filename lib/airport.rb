class Airport
  attr_reader :airport

  def initialize
    @airport = []
  end

  def land(plane)
    @airport.push(plane)
  end

  def take_off(plane)
    return plane
  end

end

class Plane
end
