require_relative 'plane.rb'

class Airport
  
  def initialize(weather = 1)
    @planes = []
    @parked = false
    @weather = weather
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
  
  def weather
     @weather = rand(1..10)
  end
  
  private
  
  def stormy?
      @weather > 5 ? false : true
  end
end
