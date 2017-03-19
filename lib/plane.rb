class Plane

  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  def descend
    @flying = false
  end

  def ascend 
    @flying = true
  end

end
