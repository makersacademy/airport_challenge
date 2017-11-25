require_relative "plane"

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail "Plane already in aiport" if @planes.include?(plane)
    @planes << plane
  end

  def take_off(plane)
    fail "Plane not in airport" if !@planes.include?(plane)
    @planes = @planes - [plane]
  end

end
