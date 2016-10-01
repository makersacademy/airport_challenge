require_relative 'plane'

class Airport
attr_reader :landed, :capacity

  def initialize
    @landed = []
    @capacity = 30
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
