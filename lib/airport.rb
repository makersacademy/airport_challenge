require_relative 'plane'

class Airport 
  CAPACITY = 5
  attr_reader :hanger 
  attr_reader :weather 
  def initialize
    @hanger = []
    rand(10) < 8 ? @weather = 'sunny' : @weather = 'stormy'
   end 

  def land(plane)
    fail "Plane cannot land! It is terrible weather for flying!" if @weather == 'stormy' 
    @plane = plane
    @hanger << @plane #in irb this passes in the obj ref i.e. <gibberish> not "boeing1" for example, can somebody explain this
  "plane has landed!"  
  end
  
  def takeoff(plane) 
    fail "Plane cannot take off! It is terrible weather for flying!" if @weather == 'stormy' 
    hanger.delete(plane) 
    "plane has taken off!"
  end 

end
