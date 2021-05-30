class Plane
  attr_accessor :plane, :flying

  def initialize
    @flying = true
  end
  
  def take_off
    flying = true
  end

  def land
    landed
  end

  def landed
    !flying
  end

end