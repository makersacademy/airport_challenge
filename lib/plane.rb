class Plane

attr_reader :flying

  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  def landed?
    !@flying
  end

  def landing
    @flying = false
  end

  def take_off
    @flying = true
  end

end
