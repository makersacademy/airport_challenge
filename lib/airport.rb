require_relative 'plane'
require_relative 'weather'
class Airport

  def initialize(capacity = 1)
    @capacity = capacity
    @parked_planes = []
  end

  def tell_to_land(plane)
    raise "Can't land; airport's full." unless @parked_planes.size < @capacity
    raise "Can't land; stormy weather." unless Weather.new.output_weather == "sunny"

    @parked_planes << plane
  end

  def tell_to_takeoff(plane)
    @parked_planes.pop
    @parked_planes.count
  end
end