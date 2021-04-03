require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 30
  attr_reader :planes, :capacity, :plane

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    @plane = plane
    landed?
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

  def landed?
    fail 'Plane has already landed' if @planes.include?(@plane)
  end

end
