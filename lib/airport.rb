require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :weather

  def initialize
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    @planes << plane unless stormy_landing
    plane.landed
  end

  def takeoff(plane)
    @planes.delete_at(@planes.index(plane)) unless stormy_takeoff
    plane.flying
  end

  def current_weather
    @weather.weather_generator
  end

private

def stormy_landing
  fail 'Too stormy to land!' if current_weather == "Stormy"
end

def stormy_takeoff
  fail 'Too stormy to take-off!' if current_weather == "Stormy"
end
end
