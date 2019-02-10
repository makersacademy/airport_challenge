class Plane

  attr_reader :air

  def initialize
    @air = true
  end

  def plane_landed
    @air = false
  end

  def plane_takeoff
    @air = true
  end

  def plane_flying?
    @air
  end

end
