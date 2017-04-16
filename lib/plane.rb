class Plane
  attr_reader :flying
  alias flying? flying

  def initialize
    @flying = true
  end

  def flight_start
    @flying = true
  end

  def flight_end
    @flying = false
  end
end
