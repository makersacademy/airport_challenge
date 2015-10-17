require_relative 'plane'

class Airport

  attr_reader :plane, :planes, :capacity, :CAPACITY


  def initialize (capacity = 10)
    @planes = []
    @capacity = capacity
  end

  def land (plane, stormy = false)
    fail 'if full' if full?
    fail 'if stormy' if stormy == true
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
