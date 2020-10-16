class Airport

  attr_reader :airport_array

  def initialize
    @airport_array = []
  end

  def land(plane)
    @airport_array << plane
  end

end

class Plane

end
