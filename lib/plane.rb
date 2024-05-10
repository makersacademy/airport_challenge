class Plane

  def landed
    @flying = false
  end

  def taken_off
    @flying = true
  end

  def flying?
    @flying
  end
end
