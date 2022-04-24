require_relative 'plane'
require_relative 'weather'

class Airport
  
  DEFAULT_CAPACITY = 5

  attr_reader :planes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport full' if full?
    fail 'Landing not allowed due to adverse weather' if stormy?
    fail 'Plane already landed' if @planes.include?(plane)
    plane.allowed_land
    @planes << plane
    plane
  end

  def take_off(plane)
    fail 'Plane not in the airport' unless @planes.include?(plane)
    fail 'Take-off not allowed due to adverse weather' if stormy?
    plane.allowed_take_off
    @planes.delete(plane)
  end

  private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    weather = Weather.stormy?
    weather
  end
          
end