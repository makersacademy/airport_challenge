# Plane Class 
# -- Instance Variable: @flying stores boolean
# -- Initialize: Plane.new() creates an plane, that is flying
# -- Getters: #flying?
# -- Setters: #land => throws exception when Plane already landed
#             #take_off => throws exception when Plane already flying

class Plane

  def initialize
    @flying = true
  end
  
  def flying?
    return @flying
  end
  
  def land
    raise 'I am already landed!' unless flying?

    @flying = false
  end

  def take_off
    raise 'I am flying already!' if flying?

    @flying = true
  end
end
