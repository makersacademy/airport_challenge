class Airport

  attr_reader :weather

  def initialize
    weather_options = ["sunny", "stormy"]
    @weather = weather_options[rand(2)]
  end

  def confirm_plane_absence(plane)
    plane.location != self
  end

end
