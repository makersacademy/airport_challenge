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
    @flying ? @flying = false : (fail 'Your plane has already landed')
  end

  def take_off
    !@flying ? @flying = true : (fail 'Your plane is already flying')
  end

end
