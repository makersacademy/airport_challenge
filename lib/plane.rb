class Plane

  def takeoff
    fail "Plane is already flying" if flying?
    @flying = true
  end

  def land
    fail "Plane is on the ground" unless flying?
    @flying = false
  end

  private

  def flying?
    @flying
  end

end
