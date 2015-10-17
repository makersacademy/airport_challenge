require './lib/plane'

class Airport

  def initialize
    @planes = []
  end

  def land(plane)
    raise "This airport is full" if @planes.length >= 1
    @planes << plane
  end

  def takeoff(plane)
    @planes.pop
  end
end
