require "class_plane.rb"
require "class_weather.rb"
class AirPort	
  def initialize(capacity: 1000, weather: Weather.new)
    @capacity = capacity
    @planes = []
    @weather = weather
  end 	

  def stormy?
    @weather.weather == :stormy
  end    

  def full?
    @capacity <= @planes.count
  end	
  
  def land(plane)
    plane.land
    fail "The airport is full!" if full?
    fail "It's stormy! You can't land." if stormy?
    @planes << plane
  end 

  def takeoff(*)
    fail "It's stormy! You can't take off." if stormy?
    fail "There is no plane to take off!" if @planes.count.zero?
    @planes.pop
  end	
end
