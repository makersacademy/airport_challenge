class Plane
  attr_accessor :flying

  def initialize(flying = true)
    @flying = flying
  end

  def flying?
    return @flying
  end
end
