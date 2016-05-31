class Plane
  def initialize
    @flying = true
  end

  def flight_start
    @flying = true
  end

  def flight_end
    @flying = false
  end

  def flying?
    @flying
  end
end
