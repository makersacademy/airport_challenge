class Plane
  
  def initialize
    @airborne = true
  end

  def airborne?
    @airborne
  end

  def grounded?
    !@airborne
  end

  def land
    @airborne = false
  end

  def take_off
    @airborne = true
  end

end
