class Plane
  attr_reader :flying
  alias_method :flying?, :flying

  def initialize
    @flying = false
  end

  def land
    fail 'Unable to land cause is not flying' unless flying?
    @flying = false
  end

  def take_off
    @flying = true
  end
end
