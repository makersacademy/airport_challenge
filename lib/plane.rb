class Plane

  def initialize
    @flying = false
  end

  def land
    @flying
  end

  def flying?
    @flying
  end

  def take_off
    fail if flying?
    @flying = true
  end
end
