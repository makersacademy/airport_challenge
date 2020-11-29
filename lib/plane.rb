class Plane

  def initialize
    @flying = true
  end

  def land(airport)
    fail "The plane has already landed." if landed
    
    @flying = false
    @airport = airport
  end

  def depart
    fail "The play is currently flying. It is not at an airport." if @flying

  end

  def airport
    fail "The plane is not currently at an airport. The plane is flying." if @flying

    @airport
  end

  def landed
    !@flying
  end

end
