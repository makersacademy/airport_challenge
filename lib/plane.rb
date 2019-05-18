class Plane
  attr_accessor :flying
  def initialize(flying = true)
    @flying = flying
  end
  def land
    self.flying = false
  end
  def flying?
    flying
  end
end