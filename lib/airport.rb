require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :weather, :capacity
  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @planes = []
    @weather = weather.conditions
  end

  def land(plane)
    raise "Cannot land plane that has landed!" if @planes.include? plane
    raise "Cannot land plane while weather is stormy!" if @weather == "STORMY"
    raise "Cannot land more planes on site than maximum capacity!" if full?
    @planes << plane
  end

  def takeoff(plane)
    raise "Cannot takeoff a plane that isn't on site!" unless @planes.include? plane
    raise "Cannot takeoff plane while weather is stormy!" if @weather == "STORMY"
    @planes.delete(plane)
  end

  def weather_update(weather: Weather.new)
    @weather = weather.conditions
  end

  private

  def full?
    @planes.count >= @capacity
  end

end
