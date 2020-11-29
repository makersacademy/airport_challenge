require './lib/plane.rb'

class Airport
  attr_reader :capacity

  def initialize(capacity = 1)
    @capacity = capacity
    @hangar = []
  end

  def land(plane)
    raise "Airport Full" unless self.full? == false
      raise "No landing, stormy weather" unless self.stormy? == false
      @hangar << plane
      @hangar.last
  end

  def takeoff(plane)
    raise "No takeoff, stormy weather" unless self.stormy? == false
      @hangar.pop
      "#{plane} has departed"
  end

  def full?
    @hangar.count >= @capacity
  end

  def chance
    rand(10)
  end

  def stormy?
    chance < 3 ? true : false
  end
end
