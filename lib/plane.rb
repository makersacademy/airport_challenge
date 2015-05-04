class Plane
  attr_accessor :flying

  def initialize(flying = true)
    @flying = flying
  end

  def flying?
    @flying
  end

  def landed?
    !@flying
  end
end