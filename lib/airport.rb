require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = []
    @weather = Weather.new
  end

  def land(plane)
    fail "Airport is full." if full?
    fail "You cannot land in a storm." if weather.stormy?
    plane_arrival(plane)
  end

  def take_off
    fail "You cannot take off in a storm." if weather.stormy?
    plane_departure
  end

  def weather_check
    weather.weather_forecast
    weather.stormy?
  end

  private

  attr_accessor :capacity, :weather_report
  attr_reader :plane, :weather

  def full?
    aircraft_hanger.length >= DEFAULT_CAPACITY
  end

  def aircraft_hanger
    capacity
  end

  def plane_departure
    departure = capacity.pop
    "The flight now leaving is: #{departure}"
  end

  def plane_arrival(plane)
    aircraft_hanger << plane
    "You have landed plane: #{plane}"
  end


end
