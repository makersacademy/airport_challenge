class Plane
  attr_reader :flying

  def initialize
    @flying = false
  end

  def take_off
    @flying = !@flying
  end

  def land
    @flying
  end

end