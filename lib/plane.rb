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
    @flying = false if @flying
  end

  def take_off
    @flying = true unless @flying
  end

end
