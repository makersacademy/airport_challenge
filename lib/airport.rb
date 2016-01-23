require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 2

  attr_reader :planes, :capacity, :weather

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
    @weather = Weather.new
  end

  def land(plane)
    fail 'Airport is full!' if @planes.count >= DEFAULT_CAPACITY
    fail 'Plane has already arrived.' if include?(plane)
    #fail 'Plane cannot land in stormy weather.' if @weather.stormy?
    plane.arrived
    @planes << plane
    plane
  end

  def takeoff(plane)
    fail 'Plane is not at this airport.' unless include?(plane)
    plane.departed
    @planes.delete(plane)
    plane
  end

  private
  def include?(plane)
    @planes.include?(plane)
  end
end