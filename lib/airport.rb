class Airport

  attr_reader :airport_array

  def initialize
    @airport_array = []
  end

  def land(plane)
    @airport_array << plane
  end

  def take_off(plane)
    @airport_array.delete_at(airport_array.find_index(plane))
    "The plane has successfully left the airport"
  end

end

class Plane

end
