class Plane

  attr_reader :flying
  alias_method :flying?, :flying

  def initialize
    @flying = false
  end

  def landplane
    fail 'Plane is not flying' unless flying?
    @flying = false
  end

  def fly
    fail 'Plane is already flying' if flying?
    @flying = true
  end

end
