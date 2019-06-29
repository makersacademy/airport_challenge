class Plane
  def initialize
    @flying = false
  end

  def fly
    @flying = true
  end

  def flying?
    true if @flying == true
  end
end
