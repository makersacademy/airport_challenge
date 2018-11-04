require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 10

  def initialize(weather = Weather.new)
    @weather = weather
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def set_capacity(num)
    @capacity = num
  end

  def land(plane)
    fail 'the airport is full' if @planes.count == @capacity
    fail 'it is too stormy to land' if @weather.stormy?
    @planes.push(plane)
  end

  def takeoff(plane)
    fail 'it is too stormy to take off' if @weather.stormy?
    @planes.delete(plane)
    "#{plane} has taken off"
  end
end
