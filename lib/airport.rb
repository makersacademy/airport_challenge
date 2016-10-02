require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail "Sorry, just too stormy" if stormy?
    plane.landed
    @planes << plane
  end

  def take_off(plane)
    plane.lift_off
    @planes.delete(plane)
  end


  private


  def stormy?
    return true if rand(1..30) == 1
  end



end
