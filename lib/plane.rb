class Plane
  def initialize
    @flying = true
  end

  attr_accessor :flying

  def flying?
    @flying
  end

  def landed?
    !@flying
  end

  def land
    @flying = false
  end

  def takeoff
    @flying = true
  end
end
