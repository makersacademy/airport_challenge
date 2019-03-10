class Airport

  CAPACITY = 10
  attr_reader :weather
  attr_accessor :fleet

  def initialize
    weather_options = ["sunny", "stormy"]
    @weather = weather_options[rand(2)]
    @fleet = []
  end

  def confirm_plane_absence(plane)
    plane.location != self
  end

  def full?
    @fleet.count >= CAPACITY
  end

end
