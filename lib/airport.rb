require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 10

  def initialize(hanger = DEFAULT_CAPACITY)
    @weather = Weather.new
    @hanger = []
  end

  def land(plane)
    fail "Airport is full." if full?
    fail "You cannot land in a storm." if weather.stormy?
    plane_arrival(plane)
  end

  def take_off
    fail "The hanger is empty." if empty?
    fail "You cannot take off in a storm." if weather.stormy?
    plane_departure
  end

  def weather_report
    weather.weather_forecast
  end

  private

  attr_accessor :hanger
  attr_reader :plane, :weather

  def full?
    aircraft_hanger.length >= DEFAULT_CAPACITY
  end

  def empty?
    aircraft_hanger.empty?
  end

  def aircraft_hanger
    hanger
  end

  def plane_departure
    departure = aircraft_hanger.pop
    "The flight now leaving is: #{departure}"
  end

  def plane_arrival(plane)
    aircraft_hanger << plane
    "You have landed plane: #{plane}"
  end
end
