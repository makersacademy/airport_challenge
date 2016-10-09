require_relative './plane'
require_relative './weather'

class Airport
  attr_accessor :planes, :capacity, :weather_today

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY, weather_today = Weather.new)
    @planes = []
    @capacity = capacity
    @weather_today = weather_today
  end

  def land(plane)
    raise "Airport is full" if full?
    raise "No landing, it's too stormy!" if weather_today.stormy?
    @planes << plane if plane.land
    "Plane arrived in the airport"
  end

  def takeoff(plane)
    @planes.delete(plane) if plane.take_off
    "Plane has left the airport"
  end

private

  def full?
    @planes.length >= @capacity
  end

end
