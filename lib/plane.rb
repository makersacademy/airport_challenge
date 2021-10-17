class Plane

  def initialize
    @flying = true
  end

  def land
    raise "NotFlying" unless flying?
    @flying = false 
  end

  def take_off 
    
  end

  private

  def flying?
    @flying
  end

end
