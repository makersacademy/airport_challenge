class Airport
  attr_reader :planes_in_airport

  def initialize
    @planes_in_airport = []
  end

  def land(plane)
    plane.landed
    @planes_in_airport << plane
  end
end
