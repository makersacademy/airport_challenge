require './docs/plane.rb'
require './docs/weather.rb'

class Airport
  attr_accessor :capacity, :planes
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def landing(plane = Plane.new)
    raise("Airport is full!") if full?
    @planes << plane
  end

  def take_off
    raise("There are no planes in the airport!") if empty?
    raise("Plane cannot take off due to stormy weather") if stormy?
    @planes.pop
  end

  def weather
    Weather.new.status
  end

  private

  def full?
    @planes.length >= @capacity
  end

  def empty?
    @planes.length == 0
  end

  def stormy?
    weather == "Stormy"
  end

end
