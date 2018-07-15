require_relative 'plane'

class Airport 
  CAPACITY = 5
  attr_reader :hanger 
  attr_reader :weather 
  def initialize
    @hanger = []
    @weather = :sunny
  end 

  def land(plane)
   fail "cannot land due to stormy weather" if weather == :stormy 
    @hanger << plane # in irb this passes in the obj ref i.e. <gibberish> not "boeing1" for example, can somebody explain this
    "plane has landed!"  
  end
  
  def takeoff(plane) 
     fail "cannot land due to stormy weather" if weather == :stormy
    hanger.delete(plane) 
    "plane has taken off!"
  end 

end
