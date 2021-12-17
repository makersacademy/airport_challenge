require_relative "plane"

class Airport
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport is full" if @hangar.count >= @capacity
    @hangar << plane
  end

  def take_off(plane)
    fail "It's too stormy to take off!" if stormy?
    @hangar.delete(plane)
  end

  def stormy?
    weather = rand(1..60)
    if weather == 13
      return true
    else
      return false
    end
  end
end
