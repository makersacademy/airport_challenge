class Plane

  def initialize
    @flying = true
  end

  def land
    raise "NotFlying" unless flying?
    @flying = false 
  end

  def flying?
    @flying
  end

end
