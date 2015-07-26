class Plane

  def initialize
    @flying = true
    @landed = false
  end

  def flying?
    @flying unless @landed == true
  end

  def permission_to_land?
    true
  end

  def landed
    !@landed unless @flying == false
  end

end
