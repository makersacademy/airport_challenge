class Plane

  def initialize
    @on_ground = false
  end

  def to_land
    fail 'Plane already landed' unless in_air?
    @on_ground = true
  end

  def take_off
    fail 'Plane already in the air' if in_air?
    @on_ground = false
  end

  def in_air?
    true unless @on_ground
  end

end
