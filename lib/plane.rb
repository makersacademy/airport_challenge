class Plane

  attr_reader :flying
  alias_method :flying?, :flying

  def initialize(flying)
    @flying = flying
  end

  def land
    fail "Plane is already on the ground" unless flying?
    @flying = false
  end

  def takeoff
    fail "Plane is already in the air" if flying?
    @flying = true
  end

end
