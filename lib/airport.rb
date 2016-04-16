class Airport

  ERR_ALREADY_LANDED = "plane already landed".freeze

  attr_reader :planes_at_airport

  def initialize
    @planes_at_airport = []
  end

  def instruct_takeoff(plane)
    plane.takeoff
    planes_at_airport.delete(plane)
  end

  def instruct_land(plane)
    return ERR_ALREADY_LANDED if in_airport?(plane)
    plane.land
    register_at_airport(plane)
  end

  private

    def weather_generator

    end

    def register_at_airport(plane)
      planes_at_airport << plane
    end

    def in_airport?(plane)
      planes_at_airport.include?(plane)
    end

end