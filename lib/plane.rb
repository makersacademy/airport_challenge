class Plane

attr_accessor :flying

  def initialize(flying = true)
    @flying = flying
  end

  def landed
    flying = false
  end

  def flying
    flying = true
  end

  def take_off
    flying = true
  end

end
