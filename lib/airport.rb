require 'weather'

class Airport
  def initialize(capacity)
    @queue = []
    @capacity = capacity
  end 

  def land(plane)
    raise 'Cannot land, airport full' if full?
    raise 'Cannot land, weather is stormy' if stormy?
    @queue.push(plane) 
    
  end

  def take_off(plane)
    raise 'Cannot take off, weather is stormy' if stormy?

  end

  def hangar
    @queue
  end

  private 
  def full?
    @queue.length >= @capacity
  end

  def stormy?
    Weather.new.stormy?
  end
end