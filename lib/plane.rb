class Plane

  attr_accessor :flying

  def initialize
    @flying
  end

  def airborn
    @flying = true
  end

  def grounded
    @flying = false
  end

end
