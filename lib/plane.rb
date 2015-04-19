class Plane
  attr_reader :status

  def initialize
    @status = 'flying'
  end

  def land
    fail 'Plane is already on ground' if on_ground?
    @status = 'landed'
  end

  def take_off
    fail 'Plane is already airborne' if airborne?
    @status = 'flying'
  end

  def airborne?
    status == 'flying'
  end

  def on_ground?
    status == 'landed'
  end
end
