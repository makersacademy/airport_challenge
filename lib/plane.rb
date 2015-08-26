class Plane
  attr_reader :flying
  alias_method :flying?, :flying

  def flying
    @flying
  end

  def takeoff
    @flying = true
  end
end
