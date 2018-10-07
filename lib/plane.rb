class Plane
  def flying?
    @flying
  end

  def fly
    @flying = true
  end

  def land
    @flying = false
  end
end
