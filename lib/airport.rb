require_relative 'plane'

class Airport
  attr_reader :planes, :capacity

  def initialize(capacity = 1)
    @capacity = capacity
    @planes = []
  end

  # Checks weather than lands plane if capacity not reached.
  def land(plane)
    weather_check
    @planes.length >= @capacity ? 
    (raise "Airport full.") : plane_in(plane); @planes << plane
  end

  # Checks weather then lets plane take off if it is currently in airport. 
  def take_off(plane)
    weather_check
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
    ['Sunny', 'Sunny', 'Sunny', 'Overcast', 'Wet', 'Cloudy', 'Stormy'].sample
  end

  # Checks weather forecast
  def weather_check
    raise 'Too stormy' if weather_forecast == 'Stormy'
  end
end
