class Plane

  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  def land
    raise 'Plane already landed!' unless flying?
    @flying = false
  end

  def take_off
    raise 'Plane already flying!' if flying?
    @flying = true
  end
end