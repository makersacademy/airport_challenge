require './lib/plane.rb'

class Airport
  def initialize
    @planes = []
    # it's stormy 1 day a week
    @weather = rand(7) == 0 ? "stormy" : "sunny"
  end

  attr_reader :planes, :weather

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    raise "Stormy weather prevents take off" if weather == "stormy"

    @planes.delete(plane)
  end
end
