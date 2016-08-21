require 'airport'


class Plane

  attr_reader :flying

  def initialise(plane = on_ground)
    @plane = plane
    @flying = false

  end

  def in_air
    @flying = true
  end

  def on_ground
    @flying = false
  end

end
