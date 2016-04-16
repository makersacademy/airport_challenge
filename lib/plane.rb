class Plane
  attr_reader :flying

  def initalize(flying = false)
    @flying = flying
  end

  def flying?
    @flying == true
  end

  def land
    @flying = false
  end

  def take_off
    @flying = true
  end
end