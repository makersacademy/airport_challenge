require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hanger = []
    @weather = Weather.new
  end

  def land_plane(plane)
    check_landing_availability
    plane.land
    hanger << plane
  end

  def take_off_plane(plane)
    check_weather_for_flights
    plane.take_off
    hanger.pop
  end

  private

  attr_reader :hanger, :weather

  def full?
    hanger.length >= @capacity
  end

  def stormy?
    weather.stormy?
  end

  def check_landing_availability
    fail "Hanger is full" if full?
    check_weather_for_flights
  end

  def check_weather_for_flights
    fail "Weather is stormy" if stormy?
  end
end
