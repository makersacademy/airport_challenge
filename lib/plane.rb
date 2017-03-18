class Plane

  def initialize
    @flying = true
  end
  
  def flying?
    @flying
  end

  def land
    @flying = false
    #landed = true
  end

  def take_off
    @flying = true
    #take_off = true
  end

end
