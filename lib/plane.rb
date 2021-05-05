class Plane
  attr_reader :flying

  def initialize
    @flying = false
  end

  def take_off
    @flying = true
  end

  def landed
    @flying = false
  end
end
