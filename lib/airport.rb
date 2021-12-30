class Airport

  CAPACITY = 5

  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def send_to_hangar(plane)
    @hangar << plane
    true
  end

  def taxi_to_runway(this_plane)
    @hangar.delete_if { |plane| plane == this_plane }
  end

  def full?
    return true if @hangar.count >= CAPACITY
    false
  end

  def check_weather
    weather_chances = ["sunny", "cloudy", "rain", "not stormy"]
    weather = weather_chances.sample
  end
end
