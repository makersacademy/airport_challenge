class Plane

  attr_reader :status

  def land(airport)
    @status = "We have landed"
  end
  
  def airborne?
    true
  end

  def take_off(airport)
    @status = "We have left the airport"
  end

end           