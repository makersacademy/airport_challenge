require_relative "plane"
require_relative "weather"

class Airport
  
  attr_reader :planes, :weather
  DEFAULT_CAPACITY = 10

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    fail "Permission to land denied" unless @weather.sunny?
    fail "Hangar is full, can't land" if full?
    @planes << plane
  end

  def take_off(plane)
    fail "Permission to depart denied" unless @weather.sunny?
    @planes.delete(plane)
  end

  private

  def full?
    @planes.count >= @capacity
  end
end
