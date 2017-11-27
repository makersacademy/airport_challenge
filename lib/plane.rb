class Plane
  attr_accessor :flying

  def initialize(flying = false)
    @flying = flying
  end

  def taking_off
    raise "Plane is already in the air" if flying
    @flying = true
  end

  def landing
    raise "Plane is already docked" unless flying
    @flying = false
  end

end
