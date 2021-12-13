
class Plane

  def initialize(flying = true)
    @flying = flying
  end

  def flying?
    @flying
  end

  def takeoff
    @flying = true
  end

  def land
    @flying = false
  end
end
