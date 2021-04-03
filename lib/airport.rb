require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 30
  attr_reader :planes, :capacity

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    empty?
    @planes << plane 
  end

  def takeoff(plane)
    @planes.delete(plane)
  end

  private
  def empty?
    fail 'Airport is full' if @planes.size >= DEFAULT_CAPACITY
  end

end
