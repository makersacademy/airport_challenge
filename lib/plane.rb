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

  def plane_takes_off
    @flying = true
  end
end
