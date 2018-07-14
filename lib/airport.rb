require_relative 'plane'

class Airport 
   attr_reader :hanger
  def initialize
  @hanger = []
  end 

    def land(plane)
      @plane = plane 
    end
  
  def takeoff(plane)
  
  end 

end
