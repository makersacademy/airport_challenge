class Plane
  attr_reader :flying
  alias_method :flying?, :flying

  def initialize
    @flying = true
  end

  def land
  end

  def take_off
  end
end
