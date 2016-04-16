class Airport

  #ERR_ALREADY_LANDED = "plane already landed".freeze
  #ERR_PLANE_NOT_FOUND = "plane not at the airport".freeze
  DEFAULT_CAPACITY = 20

  attr_reader :planes_at_airport, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes_at_airport = []
    @capacity = capacity
  end

  def instruct_takeoff(plane)
    return if stormy? or !in_airport?(plane)
    plane.takeoff
    leave_airport(plane)
  end

  def instruct_land(plane)
    return if stormy? or full? or in_airport?(plane)
    plane.land
    access_airport(plane)
  end

  def stormy?
      weather_generator == 9
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

    def full?
      planes_at_airport.count >= capacity
    end
end