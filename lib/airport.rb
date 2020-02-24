require_relative 'plane'

class Airport
  def initialize
    @total_planes = 0
  end

  def land(plane)
    @total_planes += 1
    @location = "airport"
  end

  def number_of_planes
    @total_planes
  end

  def takeoff(plane)
    @plane
    @total_planes -= 1
    @location = "sky"
  end
end
