require_relative 'plane'

class Airport
  def instruct(plane)
    plane.takeoff(plane)
  end
end
