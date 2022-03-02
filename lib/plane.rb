class Plane
  
  def initialize
    @on_ground = false
  end

  def land
    @on_ground = true
  end

  def takeoff
    @on_ground = false
  end
end
