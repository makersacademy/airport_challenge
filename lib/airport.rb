require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 200
  attr_reader :landed, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @landed = []
    @capacity = capacity
  end

  def land(plane)
    raise "The airport is full at the moment, please wait for landing." if full?
    @landed << plane
    "The plane has already landed"
  end

  def take_off
    @landed.pop
    "The plane has taken off and it is no longer in the airport"
  end

  def full?
    @landed.count >= @capacity
  end

end
