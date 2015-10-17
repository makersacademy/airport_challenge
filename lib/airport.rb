require_relative 'plane'

class Airport

  attr_reader :plane, :planes, :capacity, :stormy


  def initialize (capacity = 10)
    @planes = []
    @capacity = capacity
  end

  def land (plane)
    fail 'if full' if full?
    fail 'if stormy' if stormy
    @planes << plane
    plane
  end

  def take_off
    @planes.pop
  end

  def full?
      @planes.count >= capacity
  end

  def stormy?
    @stormy = true
  end

  def stormy
    @stormy
  end


end
