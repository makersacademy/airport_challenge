class Plane

  def land
    landed = true
  end

  def take_off
    airborne = true
  end

private
  attr_reader :landed, :airborne

end