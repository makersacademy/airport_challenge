require_relative 'Plane'
require_relative 'Weather'

class Airport

include Weather

  AIRPORT_CAPACITY = 20
  attr_reader :planes
  attr_accessor :capacity

  def initialize(capacity = AIRPORT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail StandardError, 'Weather is stormy!' unless weather == 'sunny'
    fail StandardError, "Airport is full" if full?
    plane.land
    @planes.push(plane)
  end

  def launch(plane)
    fail StandardError, 'Weather is stormy!' unless weather == 'sunny'
    fail StandardError, "Plane is not here!" unless @planes.include?(plane)
    plane.take_off
    @planes.delete(plane)
  end

  private

  def full?
    @planes.count == @capacity
  end

end
