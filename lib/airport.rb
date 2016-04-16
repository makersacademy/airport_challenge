class Airport

  ERR_ALREADY_LANDED = "plane already landed".freeze
  ERR_PLANE_NOT_FOUND = "plane not at the airport".freeze
  DEFAULT_CAPACITY = 2

  attr_reader :planes_at_airport

  def initialize
    @planes_at_airport = []
  end

  def instruct_takeoff(plane)
    return ERR_PLANE_NOT_FOUND unless in_airport?(plane)
    return if stormy?
    plane.takeoff
    leave_airport(plane)
  end

  def instruct_land(plane)
    return ERR_ALREADY_LANDED if in_airport?(plane)
    return if stormy?
    plane.land
    access_airport(plane)
  end

  private

    def in_airport?(plane)
      planes_at_airport.include?(plane)
    end

    def access_airport(plane)
      planes_at_airport << plane
    end

    def leave_airport(plane)
      planes_at_airport.delete(plane)
    end

    def weather_generator
      rand(10)
    end

    def stormy?
      weather_generator == 9
    end

end