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
    @flying ? @flying = false : (fail 'Plane has already landed')
  end

  def take_off
    !@flying ? @flying = true : (fail 'Plane is already flying')
  end

end
