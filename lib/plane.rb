require_relative 'airport'

class Plane
  attr_reader :location

  def initialize
    @flying = false
    @location = nil
  end

  def flying?
    @flying
  end

  def takeoff
    fail "Already flying!" if @flying
    update_location("In flight")
    @flying = true
  end

  def land
    fail "Already on the ground!" unless @flying
    @flying = false
  end

  def update_location(location)
    @location = location
  end
end