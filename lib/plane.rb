class Plane

  def initialize
    @flying = true
  end

  def landed?
    @flying = false
  end

  def take_off?
    @flying = true
  end

end
