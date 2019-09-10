class Plane
  attr_reader :flying

  def initialize
    @flying = false
  end

  def mark_flying
    @flying = true
  end

  def mark_landed
    @flying = false
  end
end
