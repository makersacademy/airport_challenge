class Plane

  attr_accessor :flying

  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  def landed
    @flying = false
  end

  def takenoff
    @flying = true
  end

end
