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

  def takeoff()
    @landed = false
    return !@landed
  end

end
