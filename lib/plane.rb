class Plane

  attr_accessor :flying

  def initialize
    @flying = true
  end

  def flying?
    @flying = true
  end

  def land
    @flying = false
  end

  def landed?
    !@flying
  end

end
