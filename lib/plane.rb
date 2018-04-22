class Plane

  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  def take_flight
    @flying = true
  end

  def ground
    @flying = false
  end
end
