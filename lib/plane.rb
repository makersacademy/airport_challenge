class Plane
  def land
    @flying = false
  end

  def take_off
    @flying = true
  end

  def flying?
    @flying
  end
end
