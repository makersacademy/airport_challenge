class Plane

  def initialize
    @flying = true
    # we assume upon creation the plane is in flight, alternatively could have
    # a default airport the planes are stored in upon creation
  end

  def flying?
    @flying
  end

  def land
    @flying = false
  end

  def take_off
    @flying = true
  end
  
end
