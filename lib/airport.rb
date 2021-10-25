require "weather"

class Airport
  DEFAULT_CAPACITY = 30
  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @weather = weather
    @number_of_planes = 0
  end

  def land(plane)
    raise "Cannot land, airport is full!!" if @number_of_planes >= @capacity
    raise "Cannot land plane, the weather is stormy" if stormy?
    @number_of_planes += 1
  end

  def take_off(plane)
    raise "Cannot take off, weather is stormy" if stormy?
    raise "Cannot take off, plane not at the right airport" unless at_airport?(plane)
  end

  def full?
    @number_of_planes += 1
  end

  def stormy?
    @weather.stormy?
  end

  def at_airport?(plane)
    @planes.include?(plane)
  end
end