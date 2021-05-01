class Plane
  attr_reader :flying

  def initialize
    @flying = false
  end
  def is_flying
    @flying = true
  end
end