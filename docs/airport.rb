require './docs/plane.rb'
require './docs/weather.rb'

class Airport
  attr_accessor :capacity, :planes
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def landing
    full ? raise("Airport is full!") : @planes << Plane.new
  end

  def take_off
    weather == "Stormy" ? raise("Plane cannot take off due to stormy weather") : @planes.pop
  end

  def full
    @planes.size >= @capacity
  end

  def weather
    Weather.new.status
  end
end
