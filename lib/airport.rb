require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  attr_accessor :storage, :weather, :capacity

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @storage = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    fail "Storm's a-brewing - Better divert course!" if weather.stormy?
    fail "No room at the Inn - Try another airport!" if storage.length >= capacity
    storage << plane
    plane.land
    "#{plane} has now landed."
  end

  def takeoff(plane)
    fail "Storm's a-brewing - Better hold tight!" if weather.stormy?
    storage.delete(plane)
    plane.takeoff
    "#{plane} has now taken off"
  end
end
