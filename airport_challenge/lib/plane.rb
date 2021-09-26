class Plane
  def initialize(landed = nil)
    @landed = landed
  end
    
  def plane_landed
    @landed == landedcd
  end

  def plane_flying
    @landed == nil
  end
end
