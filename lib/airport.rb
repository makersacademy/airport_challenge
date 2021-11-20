require_relative 'plane'

class Airport

  attr_reader :planes
  attr_accessor :capacity

  def initialize
    @planes = []
    @capacity = 25
  end

  def land(plane)
    fail "Airport is full" if @planes.count >= @capacity
    @planes << plane
  end

  def take_off
    fail "Stormy weather, can't take off" if stormy?
    @planes.pop
  end

  def stormy?
    if rand(0..10) == 0
      true
    else
      false
    end
  end

end
