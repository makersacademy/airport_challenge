require './lib/plane.rb'

class Airport
  def initialize(capacity = 20)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  attr_reader :planes, :capacity

  def weather
    # it's stormy 1 day a week
    rand(7).zero? ? "stormy" : "sunny"
  end

  def land(plane)
    raise "Stormy weather prevents landing" if stormy?
    raise "Cannot land, airport full" if @planes.length >= @capacity

    @planes << plane
  end

  def take_off(plane)
    raise "Stormy weather prevents take off" if stormy?

    @planes.delete(plane)
  end

  private

  def stormy?
    weather == "stormy"
  end
end
