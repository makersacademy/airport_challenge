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
    return raise("Already Flying") if @flying
    @flying = true
  end
end
