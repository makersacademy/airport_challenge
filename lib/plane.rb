class Plane
  def initialize(flying = true)
    @flying = flying
  end

  def flying?
    @flying
  end

  def landed?
    !@flying
  end

  def land
    @flying = false
  end

  def fly
    @flying = true
  end


end
