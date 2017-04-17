require './lib/plane.rb'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :planes

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def request_land(plane)
    raise("Planes cannot land as the airport is full.") if full?
    raise("Planes cannot land in a storm.") if @weather.storm
    plane.land
    @planes << plane
  end

  def request_take_off(plane)
    raise("Planes cannot take off in a storm.") if @weather.storm
    plane.take_off
    @planes.delete(plane)
  end

  def full?
    @planes.length >= @capacity
  end
end
