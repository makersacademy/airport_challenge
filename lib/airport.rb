require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 50

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def take_off
    fail 'No planes available' if empty?
    planes.pop
  end

  def land(plane)
    fail 'Airport full' if full?
    planes << plane
  end

  private

  attr_reader :planes

  def full?
    planes.count >= @capacity
  end

  def empty?
    planes.empty?
  end

end
