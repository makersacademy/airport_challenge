class Plane

  def initialize
    @air = true
  end

  def plane_landed
    @air = false
  end

  def plane_flying?
    @air
  end

end
