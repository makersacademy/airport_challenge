require_relative 'plane'

class Airport
  attr_reader :capacity, :planes, :safe
  DEFAULT_CAPACITY = 30
  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "Abort! No room for landing" if full?
    raise "Abort! Abort! Not safe for landing!" if stormy?
    planes << plane
    plane
  end

  def take_off
    raise "Not safe for take off" if stormy?
    planes.pop
  end

  def stormy?
    rand(1..100) > 70
  end





  private

  def full?
   planes.count >= capacity
  end

end
