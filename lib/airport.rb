require_relative 'plane'

class Airport

  def initialize
    @capacity = 10
  end

  def location_of plane
    plane.location
  end
end
