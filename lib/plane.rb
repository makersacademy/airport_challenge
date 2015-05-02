class Plane
  attr_accessor :flying
  attr_accessor :landed
  
  def initialize(flying = true, landed = false)
    @flying = flying
    @landed = landed
  end
  def flying?
    @flying
  end


  def landed?
    @landed
  end

end

  
