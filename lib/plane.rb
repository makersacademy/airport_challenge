class Plane

  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  def landed
    fail "Plane is already grounded" if !flying?
    @flying = false
  end

  def taken_off
    @flying = true
  end
end
