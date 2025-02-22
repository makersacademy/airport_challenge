require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor :capacity 

  DEFAULT_CAPACITY = 2

  def initialize( cap=DEFAULT_CAPACITY )
    @landed_planes = []
    @capacity = cap
    @taken_off_planes = []
    @forecast = []
  end

  def plane_land(plane) 
    # # "Plane needs to land"
    fail 'Airport is full' if full? 
    @landed_planes.push(plane)
    return true 
  end 


  def plane_take_off
    fail 'No take off: stormy weather' if stormy?
    @taken_off_planes = @landed_planes.pop
    @taken_off_planes
  end 

  def forecast
    weather = Weather.new
    @forecast = weather.todays_weather
    @forecast
  end 

private

def full?
  @landed_planes.count >= @capacity 
end

def stormy?
  if @forecast.include?("stormy") 
    return true
  else
    return false
  end
end 

end 

# airport = Airport.new
# plane = Plane.new
# puts airport.plane_land(plane)
# # # puts airport.stormy
# puts airport.plane_take_off



