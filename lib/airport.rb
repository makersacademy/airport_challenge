require_relative "weather"

class Airport
  attr_reader :hangar, :weather
  DEFAULT_CAPACITY = 15
  def initialize
    @hangar = []
    @weather = Weather.new
  end

  def land(plane)
    raise "Airport is full, you cannot land." if full?
    raise "Landing unavailable. The storm is too heavy." if stormy?
    @hangar << plane
  end

  def take_off(plane)
    raise "The weather is too bad!" if stormy?
    @hangar.delete(plane)
    "#{plane} has taken off"
  end

  private
  def stormy?
    @weather.stormy
  end

  def full?
    @hangar.count >= DEFAULT_CAPACITY
  end
end
