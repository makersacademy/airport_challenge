require_relative 'plane'
require_relative 'errors'

class Airport
  DEFAULT_CAPACITY = 30
  attr_reader :planes, :capacity

  def initialize
    @planes = []
    @capacity = 30
  end

  def land(plane)
    full?
    @planes << plane 
  end

  def takeoff(plane)
    empty?
  end

  private
  def full?
    raise LandingError if @planes.size >= DEFAULT_CAPACITY
  end

  def empty?
    raise TakeOffError if @planes.empty?
  end

end
