class Plane

  attr_accessor :flying

  def initialize
    @flying = true
  end

  def landed?
    !@flying
  end

  def flying?
    @flying = true
  end

  def lands!
    @flying = false
  end

  def takes_off!
    @flying = true
  end
end