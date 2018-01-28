require_relative 'plane'
require_relative 'weather'

class Airport
  attr_accessor :storage, :weather

  def initialize(weather = Weather.new)
    @storage = []
    @weather = weather
  end

  def land(plane)
    fail "Storm's a-brewing - Better divert course!" if @weather.stormy?
    storage << plane
    plane.land
    "#{plane} has now landed."
  end

  def takeoff(plane)
    fail "Storm's a-brewing - Better hold tight!" if @weather.stormy?
    storage.delete(plane)
    plane.takeoff
    "#{plane} has now taken off"
  end
end
