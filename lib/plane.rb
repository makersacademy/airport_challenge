class Plane

  attr_reader :flying
  alias_method :flying?, :flying

  def initialize
    @flying = true
  end

  def landplane
    @flying = false
  end

  def takeoff_plane
    @flying = true
  end

end
