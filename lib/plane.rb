class Plane 

  attr_reader :flying, :grounded

  def initialize(flying = false)
    @flying = flying
  end  

  def flying?
    @flying
  end  

  def grounded?
    !@flying
  end  

  def fly 
    @flying = true
  end  

  def touch_down
    @flying = false
  end

end
