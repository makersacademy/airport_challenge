class Plane
  #This class has the planes status of flight

  def initialize(is_flying = true)
    @is_flying = is_flying
  end

  def flying
    @is_flying = true
  end

  def landed
    @is_flying = false
  end
end
