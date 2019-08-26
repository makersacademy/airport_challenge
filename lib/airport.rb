require 'weather'
require 'plane'

class Airport

  DEFAULT_CAPACITY = 10
  ERROR_LAND_WEATHER_CONDITION = "Not possible to land during bad weather"
  FULL_ERROR = "Airport Full"


  attr_reader :hanger, :weather, :capacity

  def initialize(capacity: DEFAULT_CAPACITY, weather: Weather.new)
    @hanger = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    fail ERROR_LAND_WEATHER_CONDITION if @weather.stormy
    fail FULL_ERROR if full
    @hanger << plane
  end

  def take_off(plane)
    fail "Stormy weather" if @weather.stormy
    @hanger.delete(plane)
  end

  def full
    @hanger.size >= DEFAULT_CAPACITY
  end

end
