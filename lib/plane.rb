class Plane

  def initialize
    @flying = false
    @landed = true
  end

  def flying?
    @flying = true
  end

  def landed? 
    @landed = true
    @flying = false
  end
  
end