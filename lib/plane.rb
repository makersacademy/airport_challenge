class Plane
   
  attr_reader :flying

  def initialize(flying = true)
    @flying = flying
  end
   
  def land(airport)
    return raise("Already Grounded") unless @flying
    @flying = false
    airport.land(self)
  end

  def take_off
  	@flying = true
  end
end
