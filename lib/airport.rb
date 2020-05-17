require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :capacity, :planes

  def initialize(cap = DEFAULT_CAPACITY)
    @planes = []
    @capacity = cap
    @weather = Weather.new
  end

  DEFAULT_CAPACITY = 100

  def at_capacity?
    @planes.length == @capacity
  end

  def plane_land(plane)
    @planes << plane
  end

  def plane_take_off(plane)
    @planes.delete(plane)
  end

  def weather_is_bad?
    @weather.random_weather == 'stormy'
  end
end
