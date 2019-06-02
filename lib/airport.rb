require './lib/plane.rb'

class Airport
  def initialize(capacity = 20)
    @planes = []
    # it's stormy 1 day a week
    @weather = rand(7).zero? ? "stormy" : "sunny"
    @capacity = capacity
  end

  attr_reader :planes, :weather, :capacity

  def land(plane)
    raise "Stormy weather prevents landing" if weather == "stormy"
    raise "Cannot land, airport full" if @planes.length >= @capacity

    @planes << plane
  end

  def take_off(plane)
    raise "Stormy weather prevents take off" if weather == "stormy"

    @planes.delete(plane)
  end
end
