class Plane
  attr_accessor :flying
  def initialize
    @flying = true
  end

  def arrives
    @flying = false
  end

  def departs
    @flying = true
  end

end
