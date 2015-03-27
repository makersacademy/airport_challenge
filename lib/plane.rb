class Plane
  attr_accessor :flying
  alias_method :flying?, :flying

  def initialize
    @flying = true
  end

  def ground
    @flying = false
  end

  def take_off
    @flying = true
  end
end
