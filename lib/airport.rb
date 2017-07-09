require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def instruct_to_land(plane)
    @planes << plane
  end

  def instruct_depart(plane)
    @planes.pop
  end

end
