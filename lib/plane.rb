class Plane
  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  def take_off?
    @flying = true
  end

  def landed?
    @flying = false
  end
end
