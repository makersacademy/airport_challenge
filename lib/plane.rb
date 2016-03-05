class Plane
  attr_reader :flying
  def initialize
    @flying = false
  end

  def flying?
    @flying
  end

  def takeoff
    @flying = true
  end

  def land
    @flying = false
  end

end
