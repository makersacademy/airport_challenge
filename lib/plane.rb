class Plane

  attr_accessor :flying

  def initialize(flying = true)
    @flying = flying
  end

  def ground
    @flying = false
  end
end
