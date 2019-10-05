class Plane

def initialize
  @flying = true
end

  def land
    @flying = false
  end

  def takeoff
    @flying = true
  end

  def landed?
    !@flying
  end

  def flying?
    @flying
  end
end
