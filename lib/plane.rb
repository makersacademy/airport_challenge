class Plane
  attr_reader :flying
  alias_method :flying?, :flying

  def initialize
    @flying = true
  end

  def land_plane
    raise PlaneLandedError unless flying

    @flying = false
  end

  def takeoff_plane
    raise PlaneTakeoffError if flying
    
    @flying = true
  end
end
