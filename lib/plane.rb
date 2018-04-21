class Plane
  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  def landed?
    !@flying
  end

  def land
    raise 'Plane already landed' if landed?
    @flying = false
  end

  def take_off
    raise 'Plane already flying' if flying?
    @flying = true
  end
end
