class Plane

  def initialize
    @flying = true
  end

  def land
    fail 'Plane has already landed' if landed?
    @flying = false
    self
  end

  def take_off
    fail 'Plane cannot take off when flying' if flying?
    @flying = true
    self
  end

  def flying?
    @flying
  end

  def landed?
    !@flying
  end
  
end
