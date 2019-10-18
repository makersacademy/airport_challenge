# Final Version

class Plane
  def initialize
    landed!
  end

  def flying?
    @flying
  end

  def landed!
    @flying = false
  end

  def take_off!
    @flying = true
  end

  def airborne?
    @flying == true ? "Flying" : "Landed"
  end
end
