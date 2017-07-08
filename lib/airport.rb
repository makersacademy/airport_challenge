require 'plane'

class Airport

  attr_reader :planes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize (capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land plane
    @planes << plane
  end

  def take_off plane
    @planes.delete(plane)
  end

  def full?
    planes.count == capacity
  end

end
