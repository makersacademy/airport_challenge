require_relative 'plane'
require_relative 'weather'




class Airport 
  CAPACITY = 5
  attr_reader :hanger 
  attr_reader :weather 
  def initialize
  @hanger = []
  @weather = Weather.new 
  puts "The weather today is #{@weather.generate}"
  end 
  
  def safe_weather?
  weather == 'sunny'
  end 

  def land(plane)
    fail "Plane cannot land! It is terrible weather for flying!" if safe_weather? == false 
  
    @hanger << plane #in irb this passes in the obj ref i.e. <gibberish> not "boeing1" for example, can somebody explain this
      @plane = plane
    end
  
  def takeoff(plane) 
    fail "Plane cannot take off! It is terrible weather for flying!" if safe_weather? == false 
    hanger.delete(plane) 
    "plane has taken off!"
  end 

end
