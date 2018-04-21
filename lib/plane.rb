class Plane

  def initialize
    @flying = false
  end

  def land
    fail "Plane already on the ground" unless @flying
    @flying = false
  end

  def take_off
    fail "Plane already in-flight" if flying?
    @flying = true
  end

  def flying?
    @flying
  end

end
