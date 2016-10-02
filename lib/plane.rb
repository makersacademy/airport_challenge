
class Plane

  attr_accessor :flying

  def initialize
    @flying = true
  end

  def land(airport)
    airport::planes << self
    @flying = false
  end

  def takeoff(airport)
    airport::planes.delete(self)
    @flying = true
  end



end
