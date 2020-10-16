class Airport

  attr_reader :airport_array
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @airport_array = []
    @capacity = capacity
  end

  def land(plane, forecast)
    forecast.weather_check == true ? (return full ? (raise "The airport is full") : @airport_array << plane) : "It is too stormy to take off"
  end
  
  def take_off(plane, forecast)
    return forecast.weather_check ?
    (@airport_array.delete_at(airport_array.find_index(plane)); "The plane has successfully left the airport") : (raise "It is too stormy to take off")
  end

  private

  def full
    @airport_array.length >= @capacity
  end

end

class Plane

end

class Weather

  attr_reader :weather

  def initialize
    @weather = (rand(1..10) == 10 ? :stormy : :sunny)
  end

  def weather_check
    @weather == :sunny
  end

end
