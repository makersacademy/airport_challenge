class Plane

  attr_accessor :flying

  def initialize
    @flying = true
  end

  def flying? # or falling with style?
    @flying == true
  end

  def landed?
    !@flying
  end

  def land
    @flying = false
  end

  def take_off
    @flying = true
  end
end