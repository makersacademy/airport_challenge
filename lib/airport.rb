require_relative "plane"

class Airport

  def initialize
  @planes = []
  end

  attr_reader :planes

  def takeoff
    fail "The airport is empty" if @planes.empty?
  @planes.pop
  end

  def land(plane)
    fail "Airport full" if @planes.count >= 10
  @planes << plane
  end

end
