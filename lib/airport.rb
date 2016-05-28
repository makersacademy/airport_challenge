require_relative "plane"

class Airport

  def initialize
    @planes = []
  end

  attr_reader :plane

  def land(plane)
    fail "Airport is full" if @planes.count >= 20
    @planes << plane
  end

  def depart(plane)
    fail "No planes at airport" if @planes.empty?
    @planes.pop
  end

end
