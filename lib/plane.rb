class Plane
  attr_reader :flying

  def flying?
    flying == true
  end

  def land
    fail "Plane is not flying" if flying? == false
    @flying = false
  end

  def take_off
    fail "Plane is already flying" if flying?
    @flying = true
  end
end