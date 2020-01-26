require './lib/plane.rb'

class Airport

  attr_reader :plane

  def initialize(capacity = 1)

    @capacity = capacity
    @amount_of_planes = []

  end

  def land(plane)
    plane = Plane.new
        raise 'Airport full' if @amount_of_planes.size >= @capacity

    @amount_of_planes << plane
  end

  def take_off(plane)
    # fail 'No planes in airport' unless @plane
    @amount_of_planes.pop   
    @amount_of_planes.count
  end
end
