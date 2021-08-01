class Plane
  attr_accessor :flying

  def initialize(flying = false)
    @flying = flying
  end

  def landed
    @flying = false
  end

  def in_flight
    @flying = true
  end

end
