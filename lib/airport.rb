require './lib/weather.rb'
require './lib/plane.rb'

class Airport
  DEFAULT_CAPACITY = 20

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @weather = weather.weather_status
    @capacity = capacity
    @airplanes = []
  end

  def land(plane)
    if @airplanes.length < @capacity && !stormy?
      @airplanes.push(plane)
      return @airplanes.length
    else
      fail "Airport is Full!" if @airplanes.length >= @capacity
      fail "Stormy Weather Detected - No Flights may Land!" if stormy?
    end
  end

  def take_off(plane)
    if !stormy?
      @airplanes.delete(plane)
      return @airplanes.length
    else
      fail "Stormy Weather Detected - All Flights are Grounded!"
    end
  end

  def stormy?
    @weather == "stormy"
  end
end
