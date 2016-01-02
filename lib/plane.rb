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
    fail 'Unable to take off cause is already flying' if flying?
    @flying = true
  end
end
