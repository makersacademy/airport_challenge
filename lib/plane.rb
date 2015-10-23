class Plane

  attr_reader :flying

  def initialize
    @flying = true
  end

  def landing
    @flying = false
  end

  def taking_off
    @flying = true
  end

end
