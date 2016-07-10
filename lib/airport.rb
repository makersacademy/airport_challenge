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
    raise "Weather conditions are unsuitable to land in!" if stormy?
    plane.flying = false
    @planes << plane
  end

  def take_off
    raise "Weather conditions are unsuitable to takeoff in!" if stormy?
    @planes[-1].flying = true
    @planes.pop
  end

  def stormy?
    @forecast.stormy?
  end



end
