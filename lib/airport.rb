require './lib/plane.rb'

class Airport

  attr_reader :plane

  def initialize
    # @plane
    @amount_of_planes = []
  end

  def land(plane)
    # fail 'Airport full' unless @plane
    @plane = plane
  end

  def take_off
    fail 'No planes in airport' unless @plane

    @plane   
  end
end
