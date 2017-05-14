require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :plane
  attr_accessor :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
  end

  def land_plane(plane)
    @plane = plane
  end

  def take_off
    Plane.new
  end

  def weather_check
    conditions = Weather.new.random_weather
    p conditions
    fail 'Unsafe to fly' if conditions != 'Sunny'
  end
end
