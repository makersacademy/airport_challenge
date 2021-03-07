require 'planes'

class Airport
  attr_reader :plane, :capacity
  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @plane = []
    @planes = Plane.new
    @capacity = capacity
  end

  def instruct_to_land(plane)
    fail "CANNOT LAND, AIRPORT AT CAPACITY" if full?
    @plane << plane
  end

  def instruct_to_take_off(plane, confirm_status)
  end

  private
  def full?
    @capacity == @plane.count
  end
end
