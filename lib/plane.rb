class Plane

  attr_reader :flying
  alias_method :flying?, :flying

  def initialize
    @flying = true
  end

  def landplane
    fail 'Plane is not flying' unless flying?
    @flying = false
  end

  def fly
    @flying = true
  end

end
