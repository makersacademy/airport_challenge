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
    already_landed
    full ? raise("Airport is full!") : @planes << plane
  end

  def take_off
    empty
    weather == "Stormy" ? raise("Plane cannot take off due to stormy weather") : @planes.pop
  end

  def full
    @planes.size >= @capacity
  end

  def empty
    @planes.empty? ? raise("There are no planes in the airport!") : return
  end

  def already_landed
    @planes.uniq.length == @planes.length ? return : raise("Plane has already landed!")
  end

  def weather
    Weather.new.status
  end
end
