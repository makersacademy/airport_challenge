require_relative 'weather'
require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 100
  attr_reader :planes
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    fail 'Airport full' if full?
    fail 'Cannot land when stormy' if stormy?
    fail 'This plane is already landed' unless plane.in_flight
    plane.in_flight = false
    @planes << plane
  end
  
  def take_off(plane)
    fail 'Cannot take off when stormy' if stormy?
    fail 'Plane already in flight' if plane.in_flight
    fail 'This plane is not in this station' unless @planes.include?(plane)
    plane.in_flight = true
    @planes.delete(plane)
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def stormy?
    @weather.stormy
  end
end