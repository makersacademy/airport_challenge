class Plane
  attr_reader :flying
  alias_method :flying?, :flying

  def land
    @flying = false
  end
  
end
