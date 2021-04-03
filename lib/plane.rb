class Plane 
  attr_reader :flying

  def initialize(flying = true)
    @flying = flying
  end

  def land
    @flying = false
  end

  def flying?
    @flying
  end
end
