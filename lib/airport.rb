require_relative 'plane'

class Airport

DEFAULT_CAPACITY = 1

attr_reader :capacity

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
    @stormy = stormy
  end

  def stormy
    [true, false].sample
  end

  def land(plane)
    fail "Airport is full" if full?
    @planes << plane
  end

  def takeoff
    fail "Airport is empty" if empty?
    @planes.pop
  end

  def report
    return @planes
  end

  private

  attr_reader :planes

  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end

end
