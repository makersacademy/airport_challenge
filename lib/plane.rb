class Plane

  def initialize
    @planes = []
  end

  attr_reader :plane

  def land
  end

  def takeoff
    fail 'planes cannot takeoff' if stormy?
    @planes.pop
  end

  def stormy?
    false
  end
  
end
