require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def instruct_land(plane)
    plane.landed?
    @planes << plane
    plane
  end

  def instruct_takeoff
      plane = @planes.pop
      @planes.delete(plane)
    end


end
