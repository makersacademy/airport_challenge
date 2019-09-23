class Plane

  def initialize
    @flying = nil
    # set when plane is assigned to an airport.
  end

  def flying?
    @flying
  end

  def in_air
    @flying = true
  end

  def on_ground
    @flying = false
  end
end
