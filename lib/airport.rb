require './lib/plane.rb'
require './lib/weather.rb'

class Airport

  attr_reader :planes

  def initialize(weather:Weather.new)
    @planes = []
    @weather = weather
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    @planes.pop
  end




end
