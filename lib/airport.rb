require './lib/plane.rb'
require './lib/weather_forecaster.rb'
class Airport
  attr_reader :hangar, :capacity, :weather
  DEFAULT_CAPACITY = 50

  def initialize(capacity: DEFAULT_CAPACITY, weather: WeatherForecaster.new)
    @hangar = [Plane.new]
    @capacity = capacity
    @weather = weather
  end

  def full?
    @hangar.length >= @capacity
  end

  def plane_in_airport?(plane)
    hangar.include?(plane)
  end

  def stormy_weather 
    @weather.current == 'Stormy'
  end

  def land(plane)
    raise 'Hangar is full!' if full?
    raise 'Plane already landed!' unless plane.flying
    raise 'Weather is stormy. Unable to land!' if stormy_weather

    plane.landed
    @hangar << plane 
  end

  def take_off(plane)
    raise 'Plane not found in airport!' unless plane_in_airport?(plane)
    raise 'Weather is stormy. Unable to take-off!' if stormy_weather

    @hangar.delete(plane)
    plane.take_off
  end
end
