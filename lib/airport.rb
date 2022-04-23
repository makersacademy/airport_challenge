require_relative 'plane'
require_relative 'weather'

class Airport
  
  DEFAULT_CAPACITY = 5

  attr_reader :planes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    fail 'Airport full' if full?
    @planes << plane
  end

  def take_off(plane)
    fail 'Take-off not allowed due to adverse weather' if @weather.stormy?
    @planes.delete(plane)
  end

  private

  def full?
    @planes.length >= @capacity
  end
          
end