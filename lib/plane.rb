class Plane

  def initialize
    @flying = true
  end

  def flying?
    @flying = true
    @landed = false
  end

  def landed?
    @flying = false
    @landed = true 
  end

end
