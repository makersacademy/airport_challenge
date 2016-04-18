class Plane

  def initialize
    @flying = false
  end

  def flying?
    @flying = true
  end

  def landed? 
    @flying = false
  end
  
end