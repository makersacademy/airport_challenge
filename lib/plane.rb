class Plane
  attr_reader :flying

  def initalize(flying = false)
    @flying = flying
  end

  def flying?
    flying == true
  end

  def land
    fail "Plane is not flying" if flying? == false
    @flying = false
    self
  end

  def take_off
    fail "Plane is already flying" if flying?
    @flying = true
    self
  end
end