class Plane

  def initialize
    @flying = true
  end

  def land
    @flying = false
  end

  def flying?
    @flying
  end

end
