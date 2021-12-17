require_relative "plane"
require_relative "weather"

class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :hangar

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    fail "This plane has already landed!" if plane.location == :ground
    fail "It's too stormy to land!" if Weather.new.weather == :stormy
    fail "Airport is full" if @hangar.count >= @capacity
    plane.ground
    @hangar << plane
  end

  def take_off(plane)
    fail "This plane is already in the air!" if plane.location == :air
    fail "Your plane is in another airport!" unless @hangar.include?(plane)
    fail "It's too stormy to take off!" if Weather.new.weather == :stormy
    plane.air
    @hangar.delete(plane)
  end

end
