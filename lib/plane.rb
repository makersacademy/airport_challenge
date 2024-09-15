class Plane
  def initialize
    @flying = false
  end

  def flying?
    @flying
  end

  def change_status
    @flying = !@flying
  end
end
