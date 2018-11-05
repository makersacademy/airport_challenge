class Plane

  def initialize
    @weather = ["sunny", "stormy"].sample
    @flying = true
  end

  def already_landed?
    !@flying
  end

  def landed
    @flying = false
  end

  def flying
    @flying = true
  end

end
