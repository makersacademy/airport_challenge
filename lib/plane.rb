class Plane
  FLYING = true

  attr_accessor :flying

  def initialize(flying = FLYING)
    @flying = flying
  end

end
