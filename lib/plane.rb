class Plane
  attr_accessor :flying
  alias_method :take_off, :flying
  alias_method :flying?, :flying

  def initialize
    @flying = true
  end

  def landed
    @flying = false
  end

  def taked_off
    @flying = true
  end
end
