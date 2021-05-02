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
    @weather.get_current == 'Stormy'
  end

  def land(plane)
    raise 'Hangar is full!' if full?
    raise 'Plane already landed!' if !plane.flying
    raise 'Weather is stormy. Unable to land!' if stormy_weather
    plane.landed
    @hangar << plane 
  end
  #other tests now fail as weather is sometimes stormy, maybe need to change so weather is always sunny for those tests
  def take_off(plane)
    raise 'Plane not found in airport!' if !plane_in_airport?(plane)
    raise 'Weather is stormy. Unable to take-off!' if stormy_weather
    @hangar.delete(plane)
    plane.is_flying
  end
end