class Airport
#   attr_reader :planes_at_airport

  def initialize(capacity = 10)
    @DEFAULT_CAPACITY = capacity
    @planes_at_airport = []
  end

  def land(landing_plane)
    full?
    puts "#{landing_plane} has landed"
    @planes_at_airport << landing_plane
  end

  def take_off(departing_plane)
    weather
    puts "#{departing_plane} has taken off"
    @planes_at_airport - [departing_plane]
  end

  def full?
    fail "Airport is full" if @planes_at_airport.count == @DEFAULT_CAPACITY
  end

  def weather(condition = "Stormy")
    weather_condition = ["Sunny", "Rainy", "Windy", "Stormy", "Cloudy"]
    fail "Stormy weather, cannot take off" if condition
    fail "Stormy weather, cannot take off" if rand(weather_condition) == "Stormy"
  end

end