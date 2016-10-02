class Plane

  attr_accessor :flying

  def initialize
    @flying = false
  end

  def flying?
    @flying
  end

  def taking_off
    @flying = true
  end

  def landing
    @flying = false
  end

end
