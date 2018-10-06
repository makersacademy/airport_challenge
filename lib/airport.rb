require_relative 'plane'


class Airport
  DEFAULT_CAPACITY = 100
  attr_reader :planes
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Unable to land" if full? == true || stormy? == true
    @planes << plane
  end

  def takeoff_plane
    fail "Unable to take off" if empty? == true
    @planes.pop
  end

  def full?
    @planes.length >= @capacity
  end

  def empty?
    @planes.length == 0
  end

  def stormy?
    return true if rand * 100 < 10
    false
  end
end
