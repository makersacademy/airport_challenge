require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :hanger, :capacity

  def initialize (capacity = DEFAULT_CAPACITY)
    @hanger = []
    @capacity = capacity
  end

  def land(plane)
  raise 'Airport is full' if full?
    @hanger.push(plane)
    return @hanger
  end

  def full?
    @hanger.count >= @capacity
  end

  def takeoff
    @hanger.pop
  end
end
