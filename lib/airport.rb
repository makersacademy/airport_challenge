require_relative 'plane'

class Airport
  attr_reader :planes, :capacity

  def initialize(capacity = 1)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    weather_forecast
    @planes.length >= @capacity ? (raise "Airport full.") : plane_in(plane); @planes << plane
  end

  def take_off(plane)
    weather_forecast
    @planes.include?(plane) ? (@planes.delete(plane); plane_out(plane)) : (raise "Plane not present")
  end

  def plane_in(plane)
    plane.status = 'In airport'
  end

  def plane_out(plane)
    plane.status = 'Not in airport'
  end

  def weather_forecast
    raise 'stormy' if rand(1..10) == 1 
  end
end 