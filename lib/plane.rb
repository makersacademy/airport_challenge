class Plane

  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  def land
    fail 'Plane already landed!' unless flying?
    @flying = false
  end

  def take_off
    fail 'Plane already flying!' if flying?
    @flying = true
  end

end