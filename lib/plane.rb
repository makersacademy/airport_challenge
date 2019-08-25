class Plane

  def landed
    true
  end

  def taken_off
    @flying = true
  end

  def flying?
    @flying
  end
end
