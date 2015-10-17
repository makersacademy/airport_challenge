require_relative 'plane'

class Airport

  attr_reader :plane, :planes, :capacity

  def initialize
    @planes = []
    @capacity = 20
  end

  def land plane
    fail 'if full' if full?
    @planes << plane
    plane
  end

  def take_off
    @planes.pop
  end

  def full?
      @planes.count >= capacity
  end

  


end
