# holds the state of a plane
class Plane
  attr_reader :flying, :landed

  def initialize
    @flying = false
  end

  def flying?
    @flying
  end

  def land
    @landed = true
    self
  end
end
