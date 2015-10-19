require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor :planes, :capacity, :weather

  def initialize(capacity = 50, weather = Weather.new)
    @capacity = capacity
    @planes = []
    @weather = weather
  end

#this instructs particular plane to land
  def land(plane)
    fail "the airport is full" if full?
    fail "plane is already grounded" if plane.where_is_it?
    fail "cannot land in a storm" if bad_weather?
    plane.ground?
    @planes << plane
  end

#this instructs specific plane to take off
  def take_off(plane)
    fail "plane is already flying" if !plane.where_is_it?
    fail "cannot take off in a storm" if bad_weather?
    plane.flying?
    @planes.delete(plane)
  end

  private

  def full?
    @planes.length >= @capacity
  end

  def bad_weather?
    @weather.stormy?
  end
end
