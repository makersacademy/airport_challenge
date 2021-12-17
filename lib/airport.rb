require_relative "plane"

class Airport

  def initialize
    @hangar = []
    @capacity = 5
  end

  def land(plane)
    fail "Airport is full" if @hangar.count >= @capacity
    @hangar << plane
  end

  def take_off(plane)
    @hangar.delete(plane)
  end
end
