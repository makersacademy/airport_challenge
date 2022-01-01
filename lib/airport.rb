require_relative './weather'

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :planes, :weather
  attr_accessor :capacity

  def initialize
    @capacity = DEFAULT_CAPACITY
    @planes = []
    @weather = Weather.new
  end
  
  def land(plane)
    raise 'Airport full' if full?
    raise 'Plane has already landed' if already_landed?(plane)
    plane.land
    planes << plane
  end

  def take_off(plane)
    raise 'Plane is already in flight' if plane.in_flight?
    plane.take_off
    planes.pop
  end
  
  private

  def full?
    planes.count >= capacity
  end

  def already_landed?(plane)
    planes.include?(plane)
  end
end
