require_relative 'weather'
require_relative 'planes'
require 'pry'

class Airport

  attr_accessor :capacity, :hanger, :todays_weather

  DEFAULT_CAPACITY = 10
  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @hanger = []
    @weather_today = weather.random_weather
  end

  def land(plane)
    @hanger.push(plane)
    plane.status
  end

  def takeoff(plane)
    @hanger.delete(plane)
  end

  def safety
    raise "No flying today, weather is stormy." if stormy?
    raise 'Airport at full capacity' if full?
  end

  def stormy?
    @weather_today == :stormy
  end

  def full?
    @hanger.count >= DEFAULT_CAPACITY
  end
end
