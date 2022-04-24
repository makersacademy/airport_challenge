require_relative 'plane'

class Airport
  attr_reader :stored_planes
  CAPACITY = 5

  def initialize 
    @stored_planes = []
    @capacity = CAPACITY
  end

  def land(plane)
    fail 'Airport full!' if full?
    @stored_planes << plane
  end

  def depart(plane)
    @stored_planes.delete(plane)
  end

  def adjust_capacity(number)
    @capacity = number
  end

  private

  attr_accessor :capacity

  def full?
    @stored_planes.length >= @capacity
  end

end
