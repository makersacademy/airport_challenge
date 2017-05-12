class Plane

  attr_reader :on_ground

  def initialize
    @on_ground = true
  end

  def land(airport)
    @on_ground = true
  end

  def takeoff(destination)
    @on_ground = false
  end

end