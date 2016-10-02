
class Plane

attr_accessor :flying

  def initialize
    @flying = true
  end

  def lift_off
    @flying = true
  end

  def landed
    @flying = false
  end

end
