class Plane
  def initialize(flying = false)
    @flying = flying
  end

  def flying?
    @flying
  end

  def take_off
    fail "Plane is already flying" if @flying == true 

    @flying = true
  end

  def land
    fail "Plane is already landed" if @flying == false 

    @flying = false
  end 

end 
