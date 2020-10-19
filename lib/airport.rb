require_relative "plane"
require_relative "weather"

class Airport
  attr_accessor :hanger, :capacity, :condition

  def initialize
    @capacity = 10
    @hanger = []
  end

  def take_off
    fail "Error: Can't take-off, too stormy!" if @condition == "stormy"
    fail "Error: Airport Empty" if @hanger == []

    @hanger.pop
    @inair = "in flight"
  end

  def land(plane)
    fail "Error: Airport Full" if @hanger.length >= @capacity
    fail "Error: Can't land, too stormy!" if @condition == "stormy"

    @hanger << plane
    @inair = "on the ground"
  end
end
