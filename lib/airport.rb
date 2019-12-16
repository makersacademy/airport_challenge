require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :planes, :capacity

  def initialize(capacity= DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new

  end
  def land(plane)
    fail "Airport is full" unless @planes.count < DEFAULT_CAPACITY
    fail 'Weather is stormy' if @weather.select == "stormy"
    @planes << plane
  end

  def takeoff(plane)
    fail "The plane is no longer at the airport" unless @planes.include?(plane)
    fail "Weather is stormy" if @weather.select == "stormy"
    @planes.delete(plane)
  end
end
