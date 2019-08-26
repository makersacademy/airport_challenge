require 'weather'
require 'plane'

class Airport

  DEFAULT_CAPACITY = 10
  ERROR_TO_WEATHER_CONDITION = "Not possible to operate during bad weather"
  ERROR_AIRPORT_FULL = "Airport Full"
  ERROR_PLANE_NOT_FOUND = "This plane is not here"

  attr_reader :hanger, :weather, :capacity

  def initialize(capacity: DEFAULT_CAPACITY, weather: Weather.new)
    @hanger = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    fail ERROR_TO_WEATHER_CONDITION if @weather.stormy
    fail ERROR_AIRPORT_FULL if full

    @hanger << plane
  end

  def take_off(plane)
    fail ERROR_TO_WEATHER_CONDITION if @weather.stormy
    fail ERROR_PLANE_NOT_FOUND unless landed(plane)

    @hanger.delete(plane)
  end

  def landed(plane)
    @hanger.include?(plane)
  end

  def full
    @hanger.size >= DEFAULT_CAPACITY
  end

end
