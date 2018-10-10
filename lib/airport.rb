require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport
  
  def initialize
    @planes = []
    @weather = Weather.new
  end
  
  def land(plane)
    plane.location = 'land'
    @planes << plane
  end
  
  def takeoff(plane)
    fail 'Weather is Stormy' if stormy?
    plane.location = 'sky'
    @planes.pop
  end
  
  def stormy?
    @weather.check == true
  end
end
