require_relative 'plane'

class Airport

  attr_reader :plane, :planes, :capacity, :stormy, :flying

  def initialize (capacity = 10)
    @planes = []
    @capacity = capacity
  end

  def land (plane)
    fail 'is full' if full?
    fail 'is stormy' if stormy
    @planes << plane
    plane
  end

  def take_off plane
    fail 'is stormy' if stormy
    fail 'is flaying' if plane.flying
    @planes.delete(plane)
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
