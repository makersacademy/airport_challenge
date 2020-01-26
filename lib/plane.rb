class Plane
  def initialize
    @flying = true
  end
  
  def flying?
    @flying = true
  end

  def grounded?
    @flying = false
  end
end