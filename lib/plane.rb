class Plane
  attr_reader :plane
  attr_accessor :flying

  def initialize
    @flying = flying
  end

  def flying?
    @flying
  end

  def to_air
    @flying = true
  end

  def to_ground
    @flying = false
  end
end
