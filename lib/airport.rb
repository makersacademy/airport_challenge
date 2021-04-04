require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 30
  attr_reader :planes, :capacity

  def initialize
    @planes = []
    @capacity = 30
  end

  def land(plane)
    @plane = plane
    landed? && empty?
    @planes << plane 
  end

  def takeoff(plane)
    empty?
    @planes.delete(plane)
  end

  private
  def full?
    fail 'Airport is full' if @planes.size >= DEFAULT_CAPACITY
  end

  def landed?
    fail 'Plane has already landed' if @planes.include?(@plane)
  end

  def empty?
    fail 'Airport is empty' if @planes.empty?
  end

end
