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
    fail 'The plane is already landed!' if plane.landed?
    plane.land
    landed_planes << plane
    "Plane landed!"
  end
  
  def take_off(plane)
    fail 'Too stormy to fly!' if weather.stormy?
    fail 'The plane is already in flight!' if plane.in_flight?
    fail 'There are no planes!' if empty?
    plane.take_off
    landed_planes.delete(plane)
    "Plane took off!"
  end

  private

  def full?
    landed_planes.count == capacity
  end

  def empty?
    landed_planes.empty?
  end
end