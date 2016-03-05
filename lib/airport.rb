require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def instruct_land(plane)
    @planes << plane
    plane
  end

  # def instruct_takeoff
  #   if @planes.empty? == true
  #     "There are no planes to take off."
  #   else
  #     plane = @planes.pop
  #     @planes.delete(plane)
  #     plane.takeoff
  #     plane
  #   end
# end



end
