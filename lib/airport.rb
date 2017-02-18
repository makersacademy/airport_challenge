require_relative 'plane'

class Airport

  attr_reader :plane

  def instruct_to_land(plane)
    @plane = plane
  end

  def confirm_landed
    "#{@plane} has landed"
  end

end
