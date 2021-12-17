# Plane Class 
# -- Instance Variable: @flying stores boolean
# -- Initialized as flying = true, unless init. with Plane.new(false)
# -- Getters: flying?
# -- Setters: land => throws exception when Plane already landed
#              take_off => throws exception when Plane already flying

class Plane

  def initialize(flying = true)
    @flying = flying
  end
  
  def flying?()
    return @flying
  end
  
  def land()
    raise 'I am already landed!' unless self.flying?

    @flying = false
  end

  def take_off()
    raise 'I am flying already!' if self.flying?

    @flying = true
  end
end
