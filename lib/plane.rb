class Plane

  def initialize
    @landed
  end

  def land= (boolean)
    @landed = boolean
  end

  def land
    self.land = true
  end

  def flying
    self.land = false
  end

  def landed?
    @landed
  end
  
end
