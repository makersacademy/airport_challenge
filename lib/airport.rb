class Airport

  attr_reader :planes_in_airport

  def initialize()
  @planes_in_airport = []
  end

  def plane_is_added_to_available_fleet(plane)
      @planes_in_airport << plane
  end

  def plane_in_airport?(plane)
    @planes_in_airport.include?(plane) ? true : false
  end

  def plane_is_removed_from_available_fleet(plane)
    @planes_in_airport = @planes_in_airport - [plane]
  end
end
