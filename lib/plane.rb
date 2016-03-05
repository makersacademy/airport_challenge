class Plane
  attr_reader :flying

  def initialize
    @flying = false
  end

  def flying?
    @flying
  end

  def take_off
    @flying = true
  end

  def land
    @flying = false
  end

end