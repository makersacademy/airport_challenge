class Plane

  def takeoff
    fail "Plane is already flying" if flying?
    @flying = true
    self
  end

  def land
    fail "Plane is on the ground" unless flying?
    @flying = false
    self
  end

  private

  def flying?
    @flying
  end

end
