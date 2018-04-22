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
    raise 'Plane has already landed' if landed?
    @flying = false
  end

  def takeoff
    raise 'Plane is already in the air' if flying?
    @flying = true
  end
