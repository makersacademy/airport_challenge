require './lib/plane.rb'
class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)

    @planes << plane
  end

  def takeoff(plane)
    @planes.delete(plane)
  end

  def full?
    true
  end

end
