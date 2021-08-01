class Plane

  attr_reader :flying
  def initialize
    @flying = true
  end
  
  def flying?(status = true)
    @flying = status
  end
end
