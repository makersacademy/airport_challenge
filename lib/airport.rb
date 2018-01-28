require_relative "weather"

class Airport
  attr_reader :hangar, :weather, :capacity
  DEFAULT_CAPACITY = 15
  def initialize(capacity=DEFAULT_CAPACITY)
    @hangar = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    raise "Airport is full, you cannot land." if full?
    raise "Landing unavailable. The storm is too heavy." if stormy?
    raise "That plane has landed elsewhere" if plane.landed?
    plane.landed
    @hangar << plane
  end

  def take_off(plane)
    raise "The weather is too bad!" if stormy?
    @hangar.delete(plane)
    plane.take_off
    "#{plane} has taken off"
  end

  private
  def stormy?
    @weather.stormy
  end

  def full?
    @hangar.count >= @capacity
  end
end
