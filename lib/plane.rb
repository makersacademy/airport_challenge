class Plane
  attr_reader :flying
  def to_air
    @flying = true
  end
  
  def to_ground
    @flying = false
  end
end
