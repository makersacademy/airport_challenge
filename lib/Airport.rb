require_relative './plane.rb'
require_relative './weather.rb'

class Airport
  DEFAULT_CAPACITY = 50
  attr_reader :planes, :weather, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def change_weather(weather)
    @weather = weather
  end

  def land_plane(plane)
    fail "Weather is stormy - Cannot land plane" if @weather == 'stormy'
    fail "Airport full" if planes.length >= @capacity

    @planes << plane
  end

  def plane_take_off(plane)
    fail "Weather is stormy - cannot take off" if @weather == "stormy"

    @planes.delete(plane)
  end
end
