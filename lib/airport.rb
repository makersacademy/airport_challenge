class Airport

  attr_reader :airport_array

  def initialize(capacity = 5, weather = :sunny)
    @airport_array = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    return full ? (raise "The airport is full") : @airport_array << plane
  end

  def take_off(plane)
    return good_weather ?
    (@airport_array.delete_at(airport_array.find_index(plane)); "The plane has successfully left the airport") : (raise "It is too stormy to take off")
  end

  private

  def full
    @airport_array.length >= @capacity
  end

  def good_weather
    @weather == :sunny
  end

end

class Plane

end
