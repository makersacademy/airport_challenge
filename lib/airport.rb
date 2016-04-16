require_relative 'plane'

class Airport

  def instruct_takeoff
    Plane.new
  end

  def instruct_landing(plane)
     plane
  end
end