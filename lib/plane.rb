class Plane
  attr_reader :flying
  alias_method :flying?, :flying

  def initialize
    @flying = false
  end

  def fly
    @flying = true
  end

  def land
    @flying = false
  end
end
