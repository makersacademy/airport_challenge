class Plane

  def initialize
    @landed = false
  end 

  def take_off
    fail 'The plane is already in the sky.' unless @landed

    @landed = false
  end

  def land(airport)
    fail 'Landed planes cannot land again.' if @landed

    @landed = true
    @airport = airport
  end
  
  def airport
    fail 'The plane is not at the airport.' unless @landed
    
    @airport
  end

end
