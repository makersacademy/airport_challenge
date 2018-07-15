require './lib/plane'

class Airport

  attr_reader :planes, :weather

  def initialize
    @planes = []
  end

  def land(plane)
    fail "Takeoff not allowed due to bad weather" if @weather == "stormy"
    @planes << plane
  end

  def takeoff
    @planes.pop
  end
end
