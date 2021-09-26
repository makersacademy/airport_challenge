class Plane 
  attr_reader :landed
  def initialize
    @landed =false
  end

  def land(airport)
    if airport.respond_to?(:receive) && !(@landed)
      @landed = true
      return airport.receive(self)
    else
      return false
    end
     
  end

  def takeoff()
    @landed = false
  end

end
