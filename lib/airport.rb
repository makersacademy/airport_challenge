require_relative "plane"

class Airport
  def initialize
    @capacity = 1
    @planes = 0
  end

  def full?
    @planes == @capacity
  end

  def plane_landed
    @planes += 1
  end
end
