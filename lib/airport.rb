require_relative "weather"

class Airport
  attr_reader :hangar, :weather, :capacity
  DEFAULT_CAPACITY = 15
  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    raise "That plane has landed elsewhere" if plane.landed?
    raise "Airport is full, you cannot land." if full?
    raise "Landing unavailable. The storm is too heavy." if stormy?
    @hangar << plane
    plane.landed
  end

  def take_off(plane)
    raise "That plane is not at this airport." unless taxi(plane)
    raise "The weather is too bad!" if stormy?
    taxi(plane)
    plane.take_off
  end

  private
  def stormy?
    @weather.stormy
  end

  def full?
    @hangar.count >= @capacity
  end

  def taxi(plane)
    @hangar.delete(plane)
  end
end
