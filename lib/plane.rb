class Plane
  attr_reader :is_flying

  def initialize
    @is_flying = false
  end

  def landed
    @is_flying = false
  end

  def in_air
    @is_flying = true
  end
end
