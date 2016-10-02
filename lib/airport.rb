require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 200
  attr_reader :landed, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @landed = []
    @capacity = capacity
  end

  def land(plane)
    raise "Impossible to allow landing, weather is stormy!" if stormy?
    raise "The airport is full at the moment, please wait for landing." if full?
    #raise "Impossible to allow take off, weather is stormy!" if stormy?
    @landed << plane
    "The plane has already landed"
  end

  def take_off
    raise "Impossible to allow take off, weather is stormy!" if stormy?
    @landed.pop
    "The plane has taken off and it is no longer in the airport"
  end

  def full?
    @landed.count >= @capacity
  end

  def stormy?
    rand(1..5) == 4
  end

end
