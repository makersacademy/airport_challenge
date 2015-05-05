class Plane

  attr_accessor :flying

  def initialize
    @flying = true
  end

  def landed?
    !@flying
  end

  def flying?
    @flying
  end

  def lands!
    @flying = false
  end
end