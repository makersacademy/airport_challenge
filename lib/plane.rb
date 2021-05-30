class Plane
  attr_accessor :plane, :flying

  def initialize
    @flying = true
  end
  
  def take_off
    fail 'Plane is already in-flight' if @flying
    @flying = true
  end

  def land
    fail 'Plane is already on the ground' if !@flying
    landed
  end

  def landed
    @flying = false
  end

end