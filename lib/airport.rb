require_relative 'plane'
require_relative 'weather'

class Airport 

  DEFAULT_CAPACITY = 20
  
  attr_reader :planes, :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    raise "Plane cannot land if stormy" if stormy?
    raise "Plane cannot land. Airport is full" if full?
    raise "Plane has already landed" if @planes.include?(plane)
    @planes << plane
  end

  def take_off(plane)
    raise "The plane is not in this airport" if !@planes.include?(plane)
    raise "Plane cannot take off if stormy" if stormy?
    raise "The plane is not in this airport" unless @planes.include?(plane)
    @planes.delete(plane)
    return "The plane has taken off and left the airport"
  end

private

  def full?
    @planes.count >= @capacity
  end

  def stormy?
    rand(0..6) > 4
  end
end
