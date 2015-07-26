require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 50
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def instruct_land plane
    fail 'Airport full' if full?
    plane.land
    @planes << plane
  end

  def instruct_take_off
    fail 'No planes available' if empty?
    plane = @planes.pop
    plane.take_off
  end

  private

  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end

end
