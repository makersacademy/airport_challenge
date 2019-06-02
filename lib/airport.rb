require './lib/plane.rb'

class Airport
  def initialize
    @planes = []
    # it's stormy 1 day a week
    @weather = rand(7).zero? ? "stormy" : "sunny"
    @capacity = 20
  end

  attr_reader :planes, :weather, :capacity

  def land(plane)
    raise "Stormy weather prevents landing" if weather == "stormy"
    raise "Cannot land, airport full" unless @planes.empty?

    @planes << plane
  end

  def take_off(plane)
    raise "Stormy weather prevents take off" if weather == "stormy"

    @planes.delete(plane)
  end
end
