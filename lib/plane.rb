class Plane

  def initialize
    @flying = true
  end

  def land
    fail 'Plane already landed!' unless flying?
    @flying = false
  end

  def take_off
    fail 'Plane already flying!' if flying?
    @flying = true
  end

  private

  def flying?
    @flying
  end

end