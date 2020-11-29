require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Airport full' if full?
    @planes << plane
    'Plane has landed'
  end

  def take_off(plane)
    @planes.each_with_index do |p, i|
      if p == plane
        @planes.delete(i)
      end
    end
    'Plane has left airport'
  end

  def full?
    @planes.count >= capacity
  end




end
