require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :weather, :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    @planes << plane unless cant_land
    plane.landed
  end

  def takeoff(plane)
    @planes.delete_at(@planes.index(plane)) unless cant_takeoff
    plane.flying
  end

  def current_weather
    @weather.weather_generator
  end

private

  def cant_land
    fail 'Too stormy to land!' if current_weather == "Stormy"
    fail 'Too busy to land!' if @planes.length >= @capacity
  end

  def cant_takeoff
    fail 'Too stormy to take-off!' if current_weather == "Stormy"
  end

end
