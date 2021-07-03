require_relative 'plane'

class Airport
  attr_reader :planes, :capacity

  def initialize(capacity = 1)
    @capacity = capacity
    @planes = []
  end

  # Checks weather than lands plane if capacity not reached.
  def land(plane)
    weather_forecast
    @planes.length >= @capacity ? 
    (raise "Airport full.") : plane_in(plane); @planes << plane
  end

  # Checks weather then lets plane take off if it is currently in airport. 
  def take_off(plane)
    weather_forecast
    @planes.include?(plane) ? 
    (@planes.delete(plane); plane_out(plane)) : (raise "Plane not present")
  end

 # Next two functions help controller confirm status of individual planes.
  def plane_in(plane)
    plane.status = 'In airport'
  end

  def plane_out(plane)
    plane.status = 'Not in airport'
  end

  # Random weather generator. 10% chance of storms.
  def weather_forecast
    rand(1..10) == 1 ? (raise "Too stormy") : "Sunny"
  end
end
