require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 10

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hanger = []
    @weather = weather
  end

  def land(plane)
    fail "Airport is full." if full?
    fail "You cannot land in a storm." if weather.stormy?
    fail "Plane has already landed." if plane.in_flight == false
    plane.landed
    plane_arrival(plane)
  end

  def take_off
    fail "You cannot take off in a storm." if weather.stormy?
    fail "The hanger is empty." if empty?
    plane_departure
  end

  def weather_report
    weather.weather_forecast
  end

  private

  attr_accessor :hanger
  attr_reader :plane, :weather, :in_flight, :capacity

  def full?
    aircraft_hanger.length >= capacity
  end

  def empty?
    aircraft_hanger.empty?
  end

  def aircraft_hanger
    hanger
  end

  def plane_departure
    departure = aircraft_hanger.pop
    departure.in_flight
    "The flight now leaving is: #{departure}"
  end

  def plane_arrival(plane)
    aircraft_hanger << plane
    "You have landed plane: #{plane}"
  end
end
