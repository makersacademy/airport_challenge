class Airport

  attr_reader :airport_array

  def initialize(capacity = 5)
    @airport_array = []
    @capacity = capacity
  end

  def land(plane)
    return full ? (raise "The airport is full") : @airport_array << plane
  end

  def take_off(plane)
    @airport_array.delete_at(airport_array.find_index(plane))
    "The plane has successfully left the airport"
  end

  private

  def full
    @airport_array.length >= @capacity
  end

end

class Plane

end
