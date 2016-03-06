require_relative 'plane'

class Airport

  attr_reader :capacity

  def initialize
    @capacity = []
  end

  def instruct_to_land(plane)
    plane.land
  end

end
