require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport
  
  def initialize
    @planes = []
    @parked = false
    @weather = Weather.new
  end
  
  def land(plane)
    @parked = true
    @planes << plane
  end
  
  def takeoff
    fail 'Weather is Stormy' if stormy?
    @parked = false
    @planes.pop
  end
  
  attr_reader :parked
  
  def stormy?
    @weather == true
  end
end
