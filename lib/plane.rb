class Plane

  attr_reader :flying

  def initialize(flying = false)
    @flying = flying
  end

  def land
    @flying = false
  end

  def takeoff
    @flying = true
  end
end
