class Plane
   
  attr_reader :flying

  def initialize
    @flying = true
  end
   
  def land(airport)
    return raise("Already Grounded") unless @flying
    airport.land(self) ? @flying = false :  @flying = true
  end

  def take_off
    return raise("Already Flying") if @flying
    @flying = true
  end
end
