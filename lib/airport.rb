require_relative "plane.rb"
require_relative "weather.rb"

DEFAULT_CAPACITY = 30

class Airport
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @forecast = Weather.new
  end

  attr_reader :capacity, :forecast

  def land(plane)
    fail "Weather conditions are unsuitable to land in!" if stormy?
    fail "Airport is at maximum capacity!" if full?
    plane.flying = false
    @planes << plane
  end

  def take_off
    fail "Weather conditions are unsuitable to take off in!" if stormy?
    fail "There are no planes at the airport!" if empty?
    @planes[-1].flying = true
    @planes.pop
  end

  def stormy?
    @forecast.stormy?
  end

  def full?
    @planes.length >= @capacity
  end

  def empty?
    @planes.empty?
  end

end
