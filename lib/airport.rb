require_relative 'weather'
require_relative 'plane'

class Airport

  attr_reader :capacity

  def initialize(capacity = 5)
    @planes = []
    @capacity = capacity
    @weather = Weather.new.now?
  end

  def land_plane(plane)
    raise "Landing not possible, airport is full" if full_capacity?
    raise "Stormy weather: not possible to land" if weather_stormy?
    @planes << plane
  end

  def plane_take_off(plane)
    raise "Stormy weather: not possible to take off" if weather_stormy?
    @planes.pop
    "The plane is no longer in the airport" unless @planes.include? plane
  end

  def weather_stormy?
    @weather == :stormy
  end

  def full_capacity?
    @planes.count >= @capacity
  end

end
