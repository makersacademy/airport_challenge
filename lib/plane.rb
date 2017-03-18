class Plane

  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  def plane_lands
    @flying = false
  end
end
