require_relative './plane'
require_relative './weather'

class Airport
  attr_accessor :planes, :capacity, :weather

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    raise "Airport is full" if full?
    raise "No landing, it's too stormy!" if false #not working yet
    @planes << plane
    "Plane arrived in the airport"
  end

  def takeoff(plane)
    @planes.pop
    "Plane has left the airport"
  end

private

  def full?
    @planes.length >= @capacity
  end

end
