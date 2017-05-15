class Plane

  attr_reader :flying

  def initialize(flying = false)
    @flying = flying
  end

  def land
    @flying = false
    'Plane has landed'
  end

  def takeoff
    @flying = true
    'Plane has taken off'
  end
end
