class Plane

  def initialize
    @landed
  end

  def land=(boolean)
    @landed = boolean
  end

  def landed?
    @landed
  end

  def land
    self.land=(true)
  end

  def flying
    self.land=(false)
  end

end
