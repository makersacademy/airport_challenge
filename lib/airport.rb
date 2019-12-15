require_relative "plane"

class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes_landed = []
  end

  def land(plane)
    fail "Error, airport full!" if full?

    @planes_landed << plane
  end

  def take_off(plane)
  end

  private

  def full?
    @planes_landed.count >= @capacity
  end

end
