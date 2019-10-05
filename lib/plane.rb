class Plane

  attr_accessor :flying

  def initialize
    @flying = true
  end

  def is_not_flying
    @flying = false
  end

  def is_flying
    @flying = true
  end

end
