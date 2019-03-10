class Airport

  CAPACITY = 10
  attr_reader :weather
  attr_reader :fleet

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

  def add_plane(plane)
    @fleet << plane
  end

  def remove_plane(plane)
    @fleet.delete(plane)
  end

end
