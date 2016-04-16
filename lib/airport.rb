require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def instruct_takeoff
    plane = @planes.pop
  end

  def instruct_landing(plane)
    raise "Gate full" if @planes.count >= 50
     @planes << plane
     return plane
  end
end