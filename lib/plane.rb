class Plane
  attr_accessor :landed, :flying
  def land
    @landed = true
    @flying = false
  end
  def fly
    @flying = true
    @landed = false
  end
end