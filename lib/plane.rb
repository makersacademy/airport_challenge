class Plane
   
  attr_reader :flying, :airport

  def initialize
    @flying = true
  end
   
  def land(airport)
    return raise("Already Grounded") unless @flying
    @flying = false
    @airport = airport
    airport.land(self)
  end

  def take_off
    return raise("Already Flying") if @flying
    @flying = true
  end
end
