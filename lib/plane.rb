class Plane

  attr_reader :status

  def land(airport)
    @status = "We have landed at #{airport}"
  end
  
  def airborne?
    true
  end

  def take_off(airport)
    @status = "We have left #{airport}"
  end

end