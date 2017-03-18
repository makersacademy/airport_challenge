#I want to instruct a plane to land at an airport and confirm that it has landed

class Airport
attr_reader :planes_in_airport

  def initialize
    @planes_in_airport = []
  end

  def land(plane)
    @planes_in_airport << plane
  end
end
