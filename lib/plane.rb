class Plane

attr_reader :plane

  def in_airport?
    true
  end

  def land
    'plane landed!'
  end

  def take_off
    'plane has taken off!'
  end

  def plane_landed
    plane
  end
end
