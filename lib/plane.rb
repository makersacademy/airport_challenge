class Plane 
  attr_reader :landed
  def initialize
    @landed =false
  end

  def land(airport)
    if airport.respond_to?(:receive) && !(@landed)
      received = airport.receive(self)
      if received
        @landed = true
        return true
      end
    end
    
    #only reaches here if plane can't land
    return false
  end
  
  #this method is not supposed to be called directly
  #To make the plane fly, you must call the .send method on the airport
  #I need to change this so the takeoff method calls the send method instead
  def takeoff()
    @landed = false
    return !@landed

  end

end
