require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :capacity, :weather, :landed_planes
  DEFAULT_CAPACITY = 12

  def initialize(capacity=DEFAULT_CAPACITY, weather)
    @capacity = capacity
    @weather = weather
    @landed_planes = []
  end

  def land(plane)
    fail 'Too stormy to land!' if weather.stormy?
    fail 'No extra space!' if full?
    landed_planes << plane
    "Plane landed!"
  end

  def take_off
    fail 'Too stormy to fly!' if weather.stormy?
    landed_planes.pop
    "Plane took off!"
  end

  private

  def full?
    landed_planes.count == capacity
  end
end