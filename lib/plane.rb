class Plane

  def initialize
    @flying = true
  end

  def landed?
    @flying = false
  end

  def flying?
    @flying
  end

  def taken_off?
    @flying = true
  end

end
