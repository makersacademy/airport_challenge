class Plane

  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  def landed
    fail "Plane is already grounded" unless flying?
    @flying = false
  end

  def taken_off
    fail "Plane is already in the air" if flying?
    @flying = true
  end
end
