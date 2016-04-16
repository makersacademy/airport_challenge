class Plane
  attr_reader :flying

  def initalize(flying = false)
    @flying = flying
  end

  def flying?
    flying == true
  end

  def land
    @flying = false
    self
  end

  def take_off
    @flying = true
    self
  end
end