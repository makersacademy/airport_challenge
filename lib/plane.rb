class Plane

  def initialize
    @flying = true
  end

  def is_flying
    @flying
  end

  def land
    fail "Plane already landed" unless self.is_flying

    @flying = false
  end

end
