class Airport

  attr_reader :planes_in_airport

  def initialize
    @planes_in_airport = []
  end

  # def instruct_to_land(plane)
  #   true
  # end

  def land_plane(plane)
    @planes_in_airport << (plane)
  end

  # def instruct_to_take_off(plane)
  #   true
  # end

  def take_off(plane)
    @planes_in_airport.pop
    "#{plane} has now left airport"
  end
end
