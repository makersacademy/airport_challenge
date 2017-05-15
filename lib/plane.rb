class Plane
  attr_reader :flying

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
