require_relative './plane.rb'
require_relative './weather.rb'

class Airport

  attr_reader :planes, :weather, :capacity

  def initialize
    @planes = []
    @weather = Weather.new
    @capacity = 1
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
    @planes.delete(plane)
  end
end
