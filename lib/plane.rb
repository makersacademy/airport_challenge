class Plane

  def initialize
    @flying = true
  end

  attr_reader :flying

  def is_flying
    @flying = true
  end

  def landed
    @flying = false
  end
end
