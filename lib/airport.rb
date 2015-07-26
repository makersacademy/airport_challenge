require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 50
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land plane
    fail 'Airport full' if full?
    @planes << plane
  end

  def take_off
    fail 'No planes available' if empty?
    @planes.pop
  end

  private

  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end

end
