class Plane

  def initialize
    @flying = true
  end

  def land airport
    @flying = false
  end

  def take_off airport
    @flying = true
  end

  def flying?
    @flying
  end

  def landed?
    return true unless @flying
  end

end
