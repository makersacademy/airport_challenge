require './lib/plane.rb'

class Airport
  attr_reader :planes

  def initialize(weather)
    @planes = []
    @weather = weather
  end

  def request_land(plane)
    raise("Planes cannot land in a storm.") if @weather.storm
    plane.land
    @planes << plane
  end

  def request_take_off(plane)
    raise("Planes cannot take off in a storm.") if @weather.storm
    plane.take_off
    @planes.delete(plane)
  end
end
