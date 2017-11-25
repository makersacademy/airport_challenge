class Plane
  attr_reader :flying

  def initialize
    @flying
  end

  def taking_off
    @flying = true
  end

  def landing
    @flying = false
  end

end
