class Plane
  attr_reader :flying

  def initialize
    flying?
  end

  def flying?
    @flying = true
  end

  def set_as_flying
    flying?
  end

  def set_as_landed
    @flying = false
  end
end
