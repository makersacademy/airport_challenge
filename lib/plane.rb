class Plane

  attr_reader :flying

  def initialize(flying = true)
    @flying = flying
  end

  def ground
    @flying = false
  end

  def fly
    @flying = true
  end

  def flying?
    @flying
  end
end
