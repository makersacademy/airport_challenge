class Plane
  def initialize
    @flying = false
  end

  def flying?
    @flying
  end

  def take_off
    if @flying == true 
      fail "Plane is already flying"
    end

    @flying = true
  end

  def land
    if @flying == false 
      fail "Plane is already landed"
    end

    @flying = false
  end 

end 
