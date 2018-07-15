require_relative 'plane'
require_relative 'weather'

class Airport 
  CAPACITY = 5
  attr_reader :hanger 
  def initialize
  @hanger = []
  end 

    def land(plane)
      @hanger << plane #in irb this passes in the obj ref i.e. <gibberish> not "boeing1" for example, can somebody explain this
      @plane = plane
    end
  
  def takeoff(plane) 
    hanger.delete(plane) 
    "plane has taken off!"
  end 

end
