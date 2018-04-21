class Plane

  attr_accessor :flying

  def initialize(flying = true)
    @flying = flying
  end

  def land
    @flying = false
  end

  def take_off
    @flying = true
  end

end
