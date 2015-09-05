class Plane

  def initialize
    @flying = true
    @is_landed = false
  end

  def flying?
    @flying unless @is_landed == true
  end

  def can_land?
    true
  end

  def is_landed
    !@is_landed unless @flying == false
  end

end
