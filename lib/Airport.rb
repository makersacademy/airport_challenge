require_relative './plane.rb'
require_relative './weather.rb'

class Airport

  attr_reader :planes, :weather

  def initialize
    @planes = []
    @weather = Weather.new
  end

  def change_weather(weather)
    @weather = weather
  end

  def land_plane(plane)
    fail "Weather is stormy - Cannot land plane" if @weather == 'stormy'
    
    @planes << plane
  end

  def plane_take_off(plane)
    @planes.delete(plane)
  end
end
