require_relative 'plane'

class Airport 
  CAPACITY = 5
   attr_reader :hanger 
  def initialize
  @hanger = []
  end 

    def land(plane)
      @hanger << plane #in irb this passes in the obj ref i.e. <gibberish> not "boeing1" for example, can somebody explain thi
      @plane = plane
    end
  
  def takeoff(plane) 
    hanger.delete(plane) 
    "plane has taken off!"
  end 

end
