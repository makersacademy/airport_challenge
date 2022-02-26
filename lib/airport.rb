class Airport
#   attr_reader :planes_at_airport

  def initialize
    @planes_at_airport = []
  end

  def land(landing_plane)
    @planes_at_airport << landing_plane
  end

  def take_off(departing_plane)
    "took off"
  end

  def check

  end

end