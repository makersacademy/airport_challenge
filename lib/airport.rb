require './lib/plane.rb'

class Airport
  attr_reader :capacity

  def initialize(capacity = 1)
    @capacity = capacity
    @hangar = []
  end

  def land(plane)
    raise "Airport Full" unless self.full? == false
      @hangar << plane
      plane
  end

  def takeoff(plane)
    @hangar.pop
    "#{plane} has departed"
  end

  def full?
    @hangar.count >= @capacity
  end
end
