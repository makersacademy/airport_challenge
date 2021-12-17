require_relative "plane"

class Airport
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    fail "This plane has already landed!" if plane.location == :ground
    fail "It's too stormy to land!" if stormy?
    fail "Airport is full" if @hangar.count >= @capacity
    plane.ground
    @hangar << plane
  end

  def take_off(plane)
    fail "This plane is already in the air!" if plane.location == :air
    fail "It's too stormy to take off!" if stormy?
    fail "Your plane is in another airport!" unless @hangar.include?(plane)
    @hangar.delete(plane)
  end

  private

  def stormy?
    weather = rand(1..60)
    true if weather == 13
  end
end
