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
    @planes << plane
  end

  def take_off(plane)
    fail 'Plane not in the airport' unless @planes.include?(plane)
    fail 'Take-off not allowed due to adverse weather' if stormy?
    @planes.delete(plane)
  end

  private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    Weather.stormy?
  end
          
end