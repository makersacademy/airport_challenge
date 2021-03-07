require './lib/planes'
require './lib/weather'

class Airport
  attr_reader :plane
  attr_accessor :capacity, :weather
  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @plane = []
    check_weather = Weather.new
    @weather = check_weather.sunny
    @capacity = capacity
  end

  def instruct_to_land(plane)
    fail "CANNOT LAND, AIRPORT AT CAPACITY" if full?
    @plane << plane
  end

  def instruct_to_take_off(plane)
    fail "It is too stormy to fly" unless @weather
    @plane.delete(plane)
  end

  private
  def full?
    @capacity == @plane.count
  end
end
