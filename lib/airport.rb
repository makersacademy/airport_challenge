require_relative "plane"

class Airport
  def initialize(capacity = 1)
    @capacity = capacity
    @planes = 0
  end

  def full?
    @planes >= @capacity
  end

  def plane_landed
    fail "Airport is full" if @planes == @capacity
    @planes += 1
  end
end
