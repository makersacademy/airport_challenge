require_relative "airport_container"

class Plane
  include AirportContainer

  attr_reader :planes
  attr_reader :capacity
  
  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    raise "Plane cannot land" if full?
    @planes << plane
  end

  def take_off(plane)
    @planes.pop
    raise "Plane did not take off" if @planes.include?(plane)
  end

  def full?
    @planes.size >= @capacity
  end
end
