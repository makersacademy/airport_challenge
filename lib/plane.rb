class Plane
  attr_reader :ground

  def initialize
    @ground = false
  end

  def land
    @ground = true
  end

  def takeoff
    @ground = false
  end
end
